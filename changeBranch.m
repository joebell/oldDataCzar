%% changeBranch.m 
%
% This function navigates to a different code snapshot.  It can take several
% types of arguments:
%
%     changeBranch('branchName');
%     changeBranch('TagName');
%     changeBranch('9862490e157a0ac1b1c93a26e6d9ec750100e85b');
%     changeBranch('98624');
%     changeBranch('master');
%
% JSB 3/2011
function changeBranch(target)

    % Get the repository settings
    params = dataCzarSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    system(['git checkout ',target]);
    listBranches();
    
    cd(oldDir);