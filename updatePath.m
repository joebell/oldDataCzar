%% updatePath.m
%
function updatePath()

    % Get the repository settings
    params = simpleGitSettings();
    
    addpath(genpath([params.repoDir]));
    savepath;
    
    disp('Updating MATLAB path for new code...');