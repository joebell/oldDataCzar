%% listTags.m
%
% Lists any 'tags' that you can use to mark particularly salient version of
% code.  These tag names can be used just like you'd use a branch name or a
% code version.
%
% JSB 3/2011
function listTags()

    % Get the repository settings
    params = dataCzarSettings();

    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);

    system(['git tag -l']);

    cd(oldDir);