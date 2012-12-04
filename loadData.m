%% loadData.m
%  
%  Loads data from a file or files. It can take multiple types of inputs:
%
%       loadData(3);                 % The index number of a file
%       loadData(1,2,5:7);           % A bunch of index numbers
%       loadData('ExperimentName');
%
% JSB 3/2011 
function loadData(input)

    % Load settings
    dcSettings = dataCzarSettings();
    % Load the index
    dmIndex = loadDmIndex();

    % Returns the list of files
    list = returnFileList(input);
    
    % Load either a file number in the index or a filename
    for fileNum=list
        file = dmIndex.files(fileNum); 
        fullPath = [dcSettings.dataDir, file.name];
        if ~file.deleted            
            disp(['Loading: ',fullPath]);
        else
            disp('Warning!  That file was deleted from your index.');
            disp('I''ll try to load it anyway...');
        end  
        newData = load(fullPath);
        
        % Assign all variables in the parent workspace
        dataFields = fieldnames(newData);
        for field = 1:size(dataFields,1)
            assignin('caller',dataFields{field},getfield(newData,dataFields{field}));
        end      
    end
    
