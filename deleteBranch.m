%% deleteBranch.m
%
function deleteBranch(branch)

    % Get the repository settings
    params = simpleGitSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    % Actually delete the branch
    system(['git branch -D ', branch]);
    
    % Provide the updated branch display...
    listBranches();
    
    cd(oldDir);