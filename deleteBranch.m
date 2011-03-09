%% deleteBranch.m
%
% Use this to delete a branch you don't want anymore.  The branch will
% remain on the server, and will appear in your listBranches() as a remote
% branch.
%
% Ex: deleteBranch('unWantedBranchName');
%
% JSB 3/2011
function deleteBranch(branch)

    % Get the repository settings
    params = dataCzarSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    % Actually delete the branch
    system(['git branch -D ', branch]);
    
    % Provide the updated branch display...
    listBranches();
    
    cd(oldDir);