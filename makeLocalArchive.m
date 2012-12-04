%% makeLocalArchive.m
%
%  Backs up files whether they need it or not.  Use this to compile an
%  archive of an experiment that may have been incrementally backed up to
%  several different files over time.  It can take multiple types of inputs:
%
%       makeLocalArchive();                  % All files!
%       makeLocalArchive(3);                 % The index number of a file
%       makeLocalArchive(1,2,5:7);           % A bunch of index numbers
%       makeLocalArchive('ExperimentName');
%
% JSB 3/2011 
function makeLocalArchive(varargin)

    % Load settings
    dcSettings = dataCzarSettings();
    
    % Load the index
    dmIndex = loadDmIndex();
    
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
    backupFileName = ['DCBK-Total-',timeString,'.zip'];

    % Find the files that need to be backed up
    filesToBackup = {};
    for fileNum=list
        file = dmIndex.files(fileNum);
        if ~file.deleted
            filesToBackup{end+1} = [dcSettings.dataDir,file.name];
            dmIndex.files(fileNum).needsLocalBackup = false;
            dmIndex.files(fileNum).localBackup = backupFileName;
        end
    end

    % Save the updated index reflecting the local backup
    loadDmIndex(dmIndex);
    
    % Add the index file itself!
    filesToBackup{end+1} = [dcSettings.dataCzarDir, '.dmIndex.mat'];
    
    % Actually write a zip file
    zip(backupFileName,filesToBackup);
    disp(['Wrote total archive: ',backupFileName]);
    
    cd(oldPath);
    
