function repairNestingData()

    % Load settings
    dcSettings = dataCzarSettings();
    % Load the index
    dmIndex = loadDmIndex();


	fileNList = 25901:25995; %3900:25995;

	for fileNum = fileNList

		file = dmIndex.files(fileNum); 
   	    fullPath = [dcSettings.dataDir, file.name];

		path2 = ['/data/dataCzar0/', file.name];
		path3 = ['/data/dataCzar1/', file.name];
		if exist(fullPath, 'file')
			realPath = fullPath;
		elseif exist(path2, 'file')
			realPath = path2;
		elseif exist(path3, 'file')
			realPath = path3;
		end
		
		directory = regexprep(file.name,'-[A-Za-z0-9_]*.mat','');
		fullDirectory = [dcSettings.dataDir,directory];
    	if ~isdir(fullDirectory)
        	disp(['Creating directory: ',fullDirectory]);
        	mkdir(fullDirectory);
    	end

		copyfile(realPath,fullDirectory);

		file.name = [directory,'/',file.name];		
		dmIndex.files(fileNum) = file;
		if (mod(fileNum,100) == 0)
		    % Re-save the index to disk    
		    loadDmIndex(dmIndex);
		end

		disp(fileNum);

	end

loadDmIndex(dmIndex);
