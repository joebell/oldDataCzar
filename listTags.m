%% listTags()
%
function listTags()

    % Get the repository settings
    params = simpleGitSettings();

    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);

    system(['git tag -l']);

    cd(oldDir);