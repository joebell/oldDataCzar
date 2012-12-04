function addToDataCzar()

% baseDir = 'C:\Documents and Settings\Wilson Lab\Desktop\Data\Flight\';
baseDir = '~/Desktop/temp1/';

expName = '111229-ACV-2-POLBS';

% Scan the directory for all .mat files
files = dir(baseDir);
fileList = {};
for fileN = 1:size(files,1)
    aName = files(fileN).name;
    % If it's a .mat file
    if size(strfind(aName,'.mat'),1) > 0
        fileList{end+1} = aName;
    end
end


% fileList = {...    
%     
%     'RTTF120104-115810.mat',...
% 
% 
% };



for fileN=1:size(fileList,2)
    
    fileName = fileList{fileN};
    S = load([baseDir,fileName]);
    names = fieldnames(S);
    load([baseDir,fileName]);
    
    CMD = ['saveExperimentData(''',expName,''',''',fileName,''''];
    for nameN = 1:size(names,1)
        % Append variable name
        CMD = [CMD,',''',names{nameN},''''];
    end
    CMD = [CMD,');'];
    eval(CMD);
end
    
    