function listRecentExperiments(nToUse,varargin)

	if nargin > 1
		fieldName = varargin{1};
		useField = true;
	else
		fieldName = {};
		useField = false;
	end

	dmIndex = loadDmIndex();
        nExps = length(dmIndex.experiments);	
		
	nToDo = (nExps - nToUse + 1):nExps;

	disp('--- Recent Experiments ---');
	for expN=1:length(nToDo)
		
	disp(['[E',num2str(nToDo(expN)),'] ',...
		dmIndex.experiments{nToDo(expN)}]);
	end
	disp('--------------------------');
	
