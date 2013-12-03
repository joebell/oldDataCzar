function fileList = fileListFromExpNum(expNumber)

	dmIndex = loadDmIndex();
	fileList = returnFileList(dmIndex.experiments{expNumber});

