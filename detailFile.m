%% detailFile.m
%
%  Returns detail for a file, list of files, or an experiment name.
%
%  JSB 12/2010
%
function detailFile(input)

    % Load settings
    dcSettings = dataCzarSettings();
 
    % Load the index
    load([dcSettings.dataCzarDir,'.dmIndex.mat']);
    
    % Returns the list of files
    list = returnFileList(input);
    
    for fileNum=list
        file = dmIndex.files(fileNum);

        disp(['----- Detail for file: ',num2str(fileNum),' -----']);
        disp(' ');
        disp(['         Name: ',file.name]);
        disp(['   Experiment: ',file.experiment]);
        disp(['     Acquired: ',datestr(file.time)]);
        disp([' Local Backup: ',file.localBackup]);
        disp(['Remote Backup: ',file.remoteBackup]);
        disp(['      Deleted: ',num2str(file.deleted)]);
        disp(' ');
        disp(['     - Acquisition code -']);
        disp(file.code);
        disp(' ');

    end
    
    % Re-save the index to disk    
    save([dcSettings.dataCzarDir,'.dmIndex.mat'],'dmIndex');
