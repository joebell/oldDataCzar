%% isServerCurrent.m
%
function current = isServerCurrent()

    % Get the repository settings
    params = dataCzarSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);

    [status, text] = system('git status');
    if isempty(regexp(text,'nothing to commit'))
        current = false;
    else
        current = true;
    end
    
    cd(oldDir);