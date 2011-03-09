%% showLog.m
%
function showLog()

    % Get the repository settings
    params = simpleGitSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    if ismac
        system(['git log --decorate | cat']);
    else
        system(['git log --decorate ']);
    end
    
    cd(oldDir);