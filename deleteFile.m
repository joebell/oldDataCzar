%% deleteFile.m
%
function deleteFile(inputf)

    % Load settings
    dcSettings = dataCzarSettings();
 
    % Load the index
    load([dcSettings.dataCzarDir,'.dmIndex.mat']);
    
    % Returns the list of files
    list = returnFileList(inputf);
    
    for fileNum=1:size(list,2)
        fileName = dmIndex.files(list(fileNum)).name;

        confirm = input(['Are you SURE you want to DELETE: ',fileName,...
            ' ? (y/n)'],'s');
        if strcmp(confirm,'y')
            disp('OK, removing from index.  File on disk not touched.');
            % Don't actually delete it, just set the index flag.
            dmIndex.files(list(fileNum)).deleted = true;
        else
            disp('OK, not deleting.');
        end
    end
    
    % Re-save the index to disk    
    save([dcSettings.dataCzarDir,'.dmIndex.mat'],'dmIndex');
