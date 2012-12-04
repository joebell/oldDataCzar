%% makeRemoteBackup.m
%
%  Backs up any in-range file that hasn't been previously backed up to a 
%  zip file on the server.  It can take multiple types of inputs:
%
%       makeRemoteBackup();                  % All files!
%       makeRemoteBackup(3);                 % The index number of a file
%       makeRemoteBackup(1,2,5:7);           % A bunch of index numbers
%       makeRemoteBackup('ExperimentName');
%
% JSB 3/2011 
function makeRemoteBackup(varargin)

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
    
    %% Make a temp directory if necessary
    backupPath = [dcSettings.dataDir,'temp/'];
    if ~isdir(backupPath)
        mkdir(backupPath);
    end
    
    % Change to the path where we want the file
    oldPath = cd(backupPath);
    
    % Create a backup file name that includes the current time 
    timeString = regexprep(datestr(now),' ','-');
    timeString = regexprep(timeString,':','');
    backupFileName = ['DCBK-Remote-',timeString,'.zip'];

    % Find the files that need to be backed up
    filesToBackup = {};
    for fileNum=list
        file = dmIndex.files(fileNum);
        if (~file.deleted && file.needsRemoteBackup)
            filesToBackup{end+1} = [dcSettings.dataDir,file.name];
        end
    end
    
    % Add the index file itself!
    filesToBackup{end+1} = [dcSettings.dataCzarDir, '.dmIndex.mat'];
    
    % Actually write a zip file
    zip(backupFileName, filesToBackup);

    % Copy it to the server
    if (dcSettings.smbBackup)
        try
            copyfile(backupFileName,[dcSettings.smbDir,backupFileName]);
            disp(['Backed up to server as: ',backupFileName]);
            for fileNum=list
                dmIndex.files(fileNum).needsRemoteBackup = false;
                dmIndex.files(fileNum).remoteBackup = backupFileName;
            end
            % Save the updated index reflecting the local backup  
            loadDmIndex(dmIndex);
        catch exception
            disp('Backup to server failed.  Are you sure you''re connected?');
        end
    else
        disp('No server configured, no remote backup stored.');
    end	

    % Delete the local zip file and the temporary directory
    delete(backupFileName);
    cd(oldPath);
    rmdir(backupPath,'s');

