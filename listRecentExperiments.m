function listRecentExperiments(nToUse)

	dmIndex = loadDmIndex();
        nExps = length(dmIndex.experiments);	
		
	nToDo = (nExps - nToUse + 1):nExps;

	disp('--- Recent Experiments ---');
	for expN=1:length(nToDo)
		
	disp(['[E',num2str(nToDo(expN)),'] ',...
		dmIndex.experiments{nToDo(expN)}]);
	end
	disp('--------------------------');
	
