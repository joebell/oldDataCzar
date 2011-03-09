%% makeBranch.m
%
function makeBranch(name)

    % Get the repository settings
    params = dataCzarSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    % Creates branch with name
    system(['git checkout -b ',name]);
    % Commits branch
    system(['git commit -m "','Created branch ',name,'"']);
    % Pushes branch to server
    disp('Pushing new branch to server...');
    system(['git push origin ',name]);
    
    cd(oldDir);