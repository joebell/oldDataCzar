%% useRemoteBranch.m
%
% If someone adds a branch your computer has never used to the server, it
% will show up as a "Remote Branch" when you run listBranches();.  To
% import it to your system run useRemoteBranch('BranchName');  If there 
% are lots of them, you can use cloneRemoteBranches() to grab all of them.
%
% JSB 3/2011
function useRemoteBranch(branchName)

    % Get the repository settings
    params = dataCzarSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    system(['git checkout -t remotes/origin/',branchName]);
    listBranches();
    
    cd(oldDir);