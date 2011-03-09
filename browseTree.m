%% browseTree.m
%
%  This function opens a web browser pointed at the current repository's
%  history tree.
%
% JSB 12/2010
function browseTree()

    % Get the repository settings
    params = simpleGitSettings();
    
    web(['https://github.com/',params.repoOwner,'/',...
        params.yourRepository,'/network'], '-browser');
    