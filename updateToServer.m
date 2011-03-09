%% updateToServer() 
%
function updateToServer(message)

    % Get the repository settings
    params = simpleGitSettings();

    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    branch = getBranchList();
    
    % Pull will merge current changes
    disp('Running server update.  If this fails, run updateFromServer()');
    disp(['Adding new changes to branch: ',branch.current]);
    % Force git to ignore any hidden .mat files - use these for settings.
    ignoreFiles = fopen('.gitignore','w');
    fprintf(ignoreFiles,'.*.mat\n');
    fclose(ignoreFiles);
    % Add the rest
    system(['git add --all ']);
    disp('Committing code to local repository...');
    system(['git commit -m "',message,'"']);
    disp('Pushing changes to server...');
    pause(1);
    system(['git push origin ',branch.current]);
    system(['git push --tags ']);
    
    listBranches();
    
    cd(oldDir);