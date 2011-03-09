%% showLog.m
%
% Displays a log of dataCzar's recent dealings with the server, but only on
% the repository and branch you're working with.
%
% JSB 3/2011
function showLog()

    % Get the repository settings
    params = dataCzarSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    if ismac
        system(['git log --decorate | cat']);
    else
        system(['git log --decorate ']);
    end
    
    cd(oldDir);