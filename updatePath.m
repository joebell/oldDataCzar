%% updatePath.m
%
function updatePath()

    % Get the repository settings
    params = dataCzarSettings();
    
    addpath(genpath([params.repoDir]));
    savepath;
    
    disp('Updating MATLAB path for new code...');