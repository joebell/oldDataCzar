%% loadData.m
%  
%  Loads a file either by its index number or its name.
%
%  JSB 12/2010
%
function loadData(input)

    % Load settings
    dmSettings = dataManagerSettings();
 
    % Load the index
    load([dmSettings.dataManagerDir,'.dmIndex.mat']);
    
    % Returns the list of files
    list = returnFileList(input);
    
    % Load either a file number in the index or a filename
    for fileNum=list
        file = dmIndex.files(fileNum); 
        fullPath = [dmSettings.dataDir, file.name];
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
            assignin('caller',dataFields{field},getField(newData,dataFields{field}));
        end      
    end
    
