%% findExperiment.m
%
%  Returns a list of files matching an experiment name.
%
%  Ex: findExperiment('Or22a in Or83b2');
%
% JSB 12/2010
function listOfNumbers = findExperiment(experimentName,varargin)

	if nargin > 1
		displayOn = varargin{1};
	else
		displayOn = true;
	end
	
    % Load the index
    dmIndex = loadDmIndex();
    
    % Find the files that need to be backed up
    listOfNumbers = [];
    for fileNum=1:size(dmIndex.files,2)
        file = dmIndex.files(fileNum);
        if ~file.deleted && (size(strfind(file.experiment,experimentName),2) > 0) 
            listOfNumbers(end+1) = fileNum;
        end
    end
    % Display files found 
	if displayOn
		disp(['Found ', num2str(size(listOfNumbers,2)),' files for: ',...
			experimentName]);
	end
    
