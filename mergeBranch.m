%% mergeBranch.m
%
% Merges the target branch into the current branch.  Use this if you've
% been debugging new features on an auxillary branch, want to make them
% permanent on the 'master' branch, but the 'master' branch has also
% acquired some changes since the 'NewFeature' branch split off.  To do
% this you'd say:
%
%     changeBranch('master');
%     mergeBranch('NewFeature');
%
% This would give the current 'master' branch all the code you'd added to
% 'NewFeature'.  Note that if you change the same files in both branches
% you may have to resolve conflicts by opening the relevant files and
% removing the merged code you don't want.  Then just re-run the merge.  If
% you get confused, check out abortMerge().  This is a fairly ambitious use
% of the underlying source control platform, but the software is pretty
% smart, and you can't really hurt anything.
%
% JSB 3/2011
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