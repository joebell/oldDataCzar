%% This will regenerate an experiment list in dmIndex
function makeExpList()

	dmIndex = loadDmIndex();
	
	dmIndex.experiments = {''};
	
	for fileN = 1:length(dmIndex.files)
		if ~strcmp(dmIndex.files(fileN).experiment,dmIndex.experiments{end})
			dmIndex.experiments{end+1} = dmIndex.files(fileN).experiment;
		end
	end

	% Save the index
	loadDmIndex(dmIndex);

		

		

