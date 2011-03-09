%% makeLocalArchive.m
%
%  Backs up in-range files whether they need it or not.  Use this to 
%  compile an archive of a whole experiment.
%
%  JSB 12/2010
%
function makeLocalArchive(varargin)

    % Load settings
    dmSettings = dataManagerSettings();
    
    % Load index
    load([dmSettings.dataManagerDir,'.dmIndex.mat']);
    
    % Returns the list of files
    if nargin > 0
        list = returnFileList(varargin{1});
    else
        list = returnFileList();
    end
    
    %% Make a directory if necessary

    backupPath = [dmSettings.dataDir,'Local-Backup/'];
    if ~isdir(backupPath)
        mkdir(backupPath);
    end
    
    % Change to the path where we want the file
    oldPath = cd(backupPath);
    
    % Create a backup file name that includes the current time 
    timeString = regexprep(datestr(now),' ','-');
    timeString = regexprep(timeString,':','');
    backupFileName = ['DMBK-Total-',timeString,'.zip'];

    % Find the files that need to be backed up
    filesToBackup = {};
    for fileNum=list
        file = dmIndex.files(fileNum);
        if ~file.deleted
            filesToBackup{end+1} = [dmSettings.dataDir,file.name];
            dmIndex.files(fileNum).needsLocalBackup = false;
            dmIndex.files(fileNum).localBackup = backupFileName;
        end
    end

    % Save the updated index reflecting the local backup
    save([dmSettings.dataManagerDir,'.dmIndex.mat'],'dmIndex');
    
    % Add the index file itself!
    filesToBackup{end+1} = [dmSettings.dataManagerDir, '.dmIndex.mat'];
    
    % Actually write a zip file
    zip(backupFileName,filesToBackup);
    disp(['Wrote total archive: ',backupFileName]);
    
    cd(oldPath);
    
