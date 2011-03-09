%% graphicalGit.m
%
% Opens a GUI for using the git source control system that dataCzar is
% based on.  This is expert-only stuff, but fun to play with.
%
% JSB 3/2011
function graphicalGit()

    % Get the repository settings
    params = dataCzarSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    disp('Look for a minimized window...');
    system('gitk');
    
    cd(oldDir);
