%% updateFromServer.m
%
function updateFromServer()

    % Get the repository settings
    params = simpleGitSettings();

    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    branch = getBranchList();
    
    % Pull will merge current changes for each branch
    disp('Pulling code for all local branches from server...');
    for i=1:size(branch.locals,2)
        system(['git checkout ',branch.locals{i}]);
        system(['git pull origin ',branch.locals{i}]);
    end
    system(['git fetch --tags']);
    
    % Setting back to original branch
    system(['git checkout ',branch.current]);
    listBranches();
  
    updatePath();
    
    cd(oldDir);