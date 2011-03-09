%% listData.m
%
%  Lists files.  If passed no arguments it lists all files in the index.
%  It can also be passed a list of numbers or an experiment name.
%
%  It will first list all in-range files, then will list files that are
%  currently not backed-up either locally or remotely.  (Locally backed-up
%  files are listed with an "L", remotely backed-up files have an "R")
%
%  JSB 12/2010
%
function listData(varargin)

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

    disp(' ');
    disp('-- dataCzar File Index --');
    for fileNum=1:size(list,2)
        file = dmIndex.files(list(fileNum));
        if (file.needsLocalBackup)
            lb = ' ';
        else
            lb = 'L';
        end
        if (file.needsRemoteBackup)
            rb = ' ';
        else
            rb = 'R';
        end
        % If there's no list or the entry is in the list, list it
        if ~file.deleted
            disp(['#',num2str(list(fileNum)),' ',lb,' ',rb,' ',...
                datestr(file.time),'  ',file.name,'  ',file.experiment]);
        end
    end
    disp('----- To Be Backed-up: -----');
    for fileNum=list
        file = dmIndex.files(fileNum);
        if ~file.deleted
            if (file.needsLocalBackup)
                lb = ' ';
            else
                lb = 'L';
            end
            if (file.needsRemoteBackup)
                rb = ' ';
            else
                rb = 'R';
            end
            if (file.needsLocalBackup || file.needsRemoteBackup)
                disp(['#',num2str(fileNum),' ',lb,' ',rb,' ',...
                    datestr(file.time),'  ',file.name,'  ',file.experiment]);
            end
        end
    end
    disp('----------------------------');
    disp(' ');
