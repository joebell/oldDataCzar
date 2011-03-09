%% listTags()
%
function listTags()

    % Get the repository settings
    params = dataCzarSettings();

    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);

    system(['git tag -l']);

    cd(oldDir);