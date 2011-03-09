%% makeLocalBackup.m
%
%  Backs up any in-range file that hasn't been previously backed up to a 
%  zip file on disk.  It can take multiple types of inputs:
%
%       makeLocalBackup();                  % All files!
%       makeLocalBackup(3);                 % The index number of a file
%       makeLocalBackup(1,2,5:7);           % A bunch of index numbers
%       makeLocalBackup('ExperimentName');
%
% JSB 3/2011 
function makeLocalBackup(varargin)

    % Load settings
    dcSettings = dataCzarSettings();
    
    % Load index
    load([dcSettings.dataCzarDir,'.dmIndex.mat']);

    % Returns the list of files
    if nargin > 0
        list = returnFileList(varargin{1});
    else
        list = returnFileList();
    end
    
    %% Make a directory if necessary
    backupPath = [dcSettings.dataDir,'Local-Backup/'];
    if ~isdir(backupPath)
        mkdir(backupPath);
    end
    
    % Change to the path where we want the file
    oldPath = cd(backupPath);
    
    % Create a backup file name that includes the current time 
    timeString = regexprep(datestr(now),' ','-');
    timeString = regexprep(timeString,':','');
    backupFileName = ['DCBK-',timeString,'.zip'];

    % Find the files that need to be backed up
    filesToBackup = {};
    for fileNum=list
        file = dmIndex.files(fileNum);
        if (~file.deleted && file.needsLocalBackup)
            filesToBackup{end+1} = [dcSettings.dataDir,file.name];
            dmIndex.files(fileNum).needsLocalBackup = false;
            dmIndex.files(fileNum).localBackup = backupFileName;
        end
    end

    % Save the updated index reflecting the local backup
    save([dcSettings.dataCzarDir, '.dmIndex.mat'], 'dmIndex');
    
    % Add the index file itself!
    filesToBackup{end+1} = [dcSettings.dataCzarDir, '.dmIndex.mat'];
    
    % Actually write a zip file
    zip(backupFileName, filesToBackup);
    disp(['Wrote local backup: ', backupFileName]);
    
    cd(oldPath);
    
