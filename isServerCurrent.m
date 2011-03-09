%% isServerCurrent.m
%
% Returns true if the server has the most current version of your code or
% not.  If the server isn't current, then getCodeVersion() will reflect the
% most recent version of your code on the server, not the current version
% you're actually about to run.
%
% JSB 3/2011
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