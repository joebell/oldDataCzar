%% updatePath.m
%
% Helper function to make sure MATLAB knows where your code is being kept.
%
% JSB 3/2011
function updatePath()

    % Get the repository settings
    params = dataCzarSettings();
    
    addpath(genpath([params.repoDir]));
    savepath;
    
    disp('Updating MATLAB path for new code...');