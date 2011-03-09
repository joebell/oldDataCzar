%% cloneRemoteBranches.m
%
%  Use this if the server has some code that wasn't written on your
%  computer.  This only really occurs when you're writing code on two
%  different machines, or collaborating with someone.
%
%  It will clone all the remote branches that are displayed by
%  listBranches();
%
% JSB 3/2011
function cloneRemoteBranches()

    disp('Cloning any untracked remote branches...');

    % Get the repository settings
    params = dataCzarSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);

    % Get the branch info
    branch = getBranchList();
    
    % Checkout and track each untracked remote
    for i=1:size(branch.unTrackedRemotes,2)
        system(['git checkout -t remotes/origin/',...
            branch.unTrackedRemotes{i}]);
    end
    
    % Leave us back in the branch we were in
    system(['git checkout ',branch.current]);
    
    