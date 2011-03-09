%% useRemoteBranch.m
%
function useRemoteBranch(branchName)

    % Get the repository settings
    params = dataCzarSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    system(['git checkout -t remotes/origin/',branchName]);
    listBranches();
    
    cd(oldDir);