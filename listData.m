%% listData.m
%
%  Lists the contents of dataCzar's data index.  It can take multiple 
%  types of inputs:
%
%       listData();                  % Show everything you've got!
%       listData(3);                 % The index number of a file
%       listData(1,2,5:7);           % A bunch of index numbers
%       listData('ExperimentName');  % Just data from one experiment
%
%  It will first list all in-range files, then will list files that are
%  currently not backed-up remotely.  (Remotely backed-up files have an "R")
%
% JSB 3/2011 
function listData(varargin)

    % Load the index
    dmIndex = loadDmIndex();

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
        if (file.needsRemoteBackup)
            rb = '_';
        else
            rb = 'R';
        end
        % If there's no list or the entry is in the list, list it
        if ~file.deleted
            disp(['#',num2str(list(fileNum)),' ',rb,' ',...
                datestr(file.time),'  ',file.name,'  ',file.experiment]);
        end
    end
    disp('----- To Be Backed-up: -----');
    for fileNum=list
        file = dmIndex.files(fileNum);
        if ~file.deleted
            if (file.needsRemoteBackup)
                rb = '_';
            else
                rb = 'R';
            end
            if (file.needsRemoteBackup)
                disp(['#',num2str(fileNum),' ',rb,' ',...
                    datestr(file.time),'  ',file.name,'  ',file.experiment]);
            end
        end
    end
    disp('----------------------------');
    disp(' ');
