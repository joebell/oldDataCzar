%% cloneRemoteBranches
%
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
    
    