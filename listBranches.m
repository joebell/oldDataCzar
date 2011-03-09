%% listBranches.m
%
function listBranches()

    % Get the repository settings
    params = dataCzarSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    branch = getBranchList();
    
    disp(' ');
    disp(['Repository: ',params.yourRepository]);
    disp('-Local Branches:');
    for i=1:size(branch.locals,2)
        if strcmp (branch.locals{i},branch.current)
            disp(['* ',branch.locals{i}]);
        else
            disp(['  ',branch.locals{i}]);
        end
    end
    disp('-Remote Branches:');
    for i=1:size(branch.unTrackedRemotes,2)
        disp(['  ',branch.unTrackedRemotes{i}]);
    end
    disp(' ');
    
    cd(oldDir);