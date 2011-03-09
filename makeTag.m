%% makeTag.m
%
function makeTag(name)

    % Get the repository settings
    params = dataCzarSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    system(['git tag ',name]);
    system(['git push origin --tags']);
    
    cd(oldDir);