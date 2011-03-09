%% findExperiment.m
%
%  Returns a list of files with matching experiment name.
%
%  JSB 12/2010
%
function listOfNumbers = findExperiment(experimentName)

    % Load settings
    dmSettings = dataManagerSettings();
    
    % Load index
    load([dmSettings.dataManagerDir,'.dmIndex.mat']);
    
    % Find the files that need to be backed up
    listOfNumbers = [];
    for fileNum=1:size(dmIndex.files,2)
        file = dmIndex.files(fileNum);
        if ~file.deleted && strcmp(file.experiment,experimentName) 
            listOfNumbers(end+1) = fileNum;
        end
    end
    % Display files found 
    disp(['Found ', num2str(size(listOfNumbers,2)),' files for: ',...
	    experimentName]);
    
