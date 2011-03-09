%% abortMerge.m
%
%  This command aborts any merge in progress. Use this if you get stuck. 
%
function abortMerge()

    % Get the repository settings
    params = simpleGitSettings();

    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);

    system(['git reset --hard']);

    cd(oldDir);