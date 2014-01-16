%% saveExperimentData.m
%
%  Use this as a replacement for MATLAB's save() command.  This saves 
%  your data to disk, but it also saves metadata like the time you're 
%  saving, the current version of the code tracked by dataCzar, and whether 
%  the file has been backed up.
%
%  Just like save(), this will overwrite an existing file on disk without 
%  prompting you.
%
%  Ex:  saveExperimentData('Experiment Name','fileName', 'variableName1', 'variableName2', ...) 
%
%  JSB 3/2011
function saveExperimentData(experimentName,fileName, varargin)


    % Load settings
    dcSettings = dataCzarSettings();
    
    %% Make a directory if necessary

    fullPath = [dcSettings.dataDir,fileName];
    % Get just the directory
    directory = regexprep(fullPath,'[A-Za-z0-9_-]*.mat','');
    if ~isdir(directory)
        disp(['Creating directory: ',directory]);
        mkdir(directory);
    end
    
    %% Load the index
    dmIndex = loadDmIndex();
    
    %% Store the name of the file and other params in the master list
    
    % Save the experiment name
    file.experiment = experimentName;
    % Add the rest of the file info
    file.name = fileName;
    file.time = datevec(now);
    file.needsRemoteBackup = true;
    file.remoteBackup = '';
    file.deleted = false;
    file.code = getCodeVersion();

    if ~strcmp(experimentName,dmIndex.experiments{end})
	dmIndex.experiments{end+1} = experimentName;
    end


    % If this is new, create a list of files
    overWrite = true;
    if ~isfield(dmIndex,'files')
        fileList = file;
    % Otherwise add the index to the list of files.
    else
        fileList = dmIndex.files;
	
        % Check to make sure it's not already in there!
        listSize = size(fileList,2);
        for fileNum = 1:listSize
            oldfile = fileList(fileNum);
            % If you find a duplicate filename...
            if ~oldfile.deleted && strcmp(oldfile.name,fileName)
                % 		confirm = input(['There is already a file in the ', ...
                % 		    ' database with the name: ',fileName,'\n Are you ',...
                % 		    'sure you want to overwrite it? (y/n)'],'s');
                % And if you're sure you want to over write it...
                %		if strcmp(confirm,'y')
                if true
                    % Delete the old file
                    % disp('OK, overwriting. Deleting old version...');
                    fileList(fileNum).deleted = true;
                else
                    disp('OK, try again with another name.');
                    overWrite = false;
                end % if confirmed
            end % end if duplicates
        end  % end for all files
        
        % If there's no objection, add it to the list...
        if (overWrite)
            fileList(end+1) = file;
        end
    end % end if new index
  
    % If we're ok, actually write the file and save the index
    if (overWrite)
        % Saves all the variables it was passed.
        cmd = ['save(''',fullPath,''''];
        for i=1:size(varargin,2)
            values{i} = evalin('caller',varargin{i});
            cmd = [cmd,',''',varargin{i},''''];
            eval([varargin{i},'=values{i};']);
        end
        cmd = [cmd,');'];

        eval(cmd)


        disp(['Data stored as: ',fullPath,...
            ' and queued to be backed-up.']);
        % Store it back in dmIndex
        dmIndex.files = fileList;
        % Re-save the index to disk    
        loadDmIndex(dmIndex);
    end

