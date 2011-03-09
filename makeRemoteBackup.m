%% makeRemoteBackup.m
%
%  Backs up in-range files that need it to a zip-file on the remote 
%  server.  Can take no arguments to back-up the whole index, or a list
%  of file numbers, or an experiment name.
%
%  JSB 12/2010
%
function makeRemoteBackup(varargin)

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
    backupFileName = ['DMBK-Remote-',timeString,'.zip'];

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
            save([dcSettings.dataCzarDir, '.dmIndex.mat'], 'dmIndex');
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

