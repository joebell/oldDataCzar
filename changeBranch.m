%% changeBranch.m 
%
function changeBranch(target)

    % Get the repository settings
    params = dataCzarSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    system(['git checkout ',target]);
    listBranches();
    
    cd(oldDir);