function fileList = fileListFromExpNum(expNumber,varargin)

	if nargin > 1
		displayOn = varargin{1};
	else
		displayOn = true;
	end

	dmIndex = loadDmIndex();
	fileList = returnFileList(dmIndex.experiments{expNumber},displayOn);

