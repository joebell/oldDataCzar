%% mergeBranch.m
%
function mergeBranch(target)

    % Get the repository settings
    params = dataCzarSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    branch = getBranchList();
    
    sure = input(['Are you sure you want to commit current changes to ',...
        branch.current,' and then merge ',target,' into it? (y/n): '],'s');
    
    if strcmp(sure,'y')
        % Commit current changes
        system(['git add --all']);
        system(['git commit -m "About to merge with ',target,'"']);
        system(['git push origin ',branch.current]);
        
        % Do the merge
        system(['git merge ',target]);
        system(['git push origin ',branch.current]);
    else
        disp('Ok, aborted.');
    end
    
    cd(oldDir);