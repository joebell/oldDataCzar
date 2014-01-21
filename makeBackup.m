%% makeBackup.m
%
%  Backs up any file that hasn't been previously backed up to a remote
%  directory via rsync. This also captures .dmIndex.mat 
%
%  It works only on the whole dataDir.
%
% JSB 11/2013 
function makeBackup()

    % Load settings
    dcSettings = dataCzarSettings();

	list = returnFileList();
	dmIndex = loadDmIndex();

    % Copy it to the server
    if (dcSettings.remoteRsyncBackup)
        try
			
			cmd = ['rsync ',dcSettings.remoteRsyncOptions,' ',...
						dcSettings.dataDir,' ',dcSettings.remoteRsyncHost];
		    disp(['Backuping up using: ',cmd]);
			[status,result] = unix(cmd,'-echo');
            for fileNum=list
                dmIndex.files(fileNum).needsRemoteBackup = false;
                dmIndex.files(fileNum).remoteBackup = dcSettings.remoteRsyncHost;
            end
            % Save the updated index reflecting the local backup  
            loadDmIndex(dmIndex);
			disp('Backup to remote server completed.');
        catch exception
            disp('Backup to server failed.  Are you sure you''re connected?');
        end
    else
        disp('No server configured, no remote backup stored.');
    end	



