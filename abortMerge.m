%% abortMerge.m
%
%  This command aborts any merge in progress. Use this if you get stuck. 
%
% JSB 3/2011
function abortMerge()

    % Get the repository settings
    params = dataCzarSettings();

    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);

    system(['git reset --hard']);

    cd(oldDir);