function nextFNum = nextFileNumber()

    % Load the index
    dmIndex = loadDmIndex();
	mostRecent = size(dmIndex.files,2);
	nextFNum = mostRecent + 1;
