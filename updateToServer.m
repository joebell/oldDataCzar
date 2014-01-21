%% updateToServer.m
%
% This updates the server with any changes you've made to the branch of
% code you're working on.  It does NOT update any hidden files (filenames 
% starting with a period).  This requires a message used to identify the
% update.
%
% Ex: updateToServer('Added histogram generation code to data display.');
%
% JSB 3/2011
function updateToServer(message)

    % Get the repository settings
    params = dataCzarSettings();

    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    branch = getBranchList();
    
    % Pull will merge current changes
    disp('Running server update.  If this fails, run updateFromServer()');
    disp(['Adding new changes to branch: ',branch.current]);

    % Add the rest
    system(['git add --all ']);
    disp('Committing code to local repository...');
    system(['git commit -m "',message,'"']);
    % disp('Pushing changes to server...');
    %pause(1);
    %system(['git push origin ',branch.current]);
    %system(['git push --tags ']);
    
    listBranches();
    
    cd(oldDir);
