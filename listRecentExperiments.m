function listRecentExperiments(input,varargin)

	if nargin > 1
		varName = varargin{1};
		useVar = true;
	else
		varName = {};
		useVar = false;
	end

	dmIndex = loadDmIndex();
        nExps = length(dmIndex.experiments);	

    if length(input) == 1		
		nToUse = input;
		nToDo = (nExps - nToUse + 1):nExps;
	else
		nToDo = input;
	end

	disp('--- Recent Experiments ---');
	for expNn=1:length(nToDo)

		expN = nToDo(expNn);

		if useVar
			displayOn = false;
			fileList = fileListFromExpNum(expN,displayOn);
			loadData(fileList(1),displayOn);
			dataObj = eval([varName{1},';']);
			for levelN = 2:length(varName)
				dataObj = dataObj.(varName{levelN});
			end
			varString = [' - ',num2str(dataObj)];
		else
			varString = '';
		end

		disp(['[E',num2str(expN),'] ',...
			dmIndex.experiments{expN},varString]);
	end
	disp('--------------------------');
	
