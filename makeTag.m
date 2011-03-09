%% makeTag.m
%
% This creates a 'tag' or shorthand name for the current version of your
% code.  For example, you might make a tag called 'v1.0' so you could
% always return to it by running changeBranch('v1.0');
%
% Ex: makeTag('v1.0');
%
% JSB 3/2011
function makeTag(name)

    % Get the repository settings
    params = dataCzarSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    system(['git tag ',name]);
    system(['git push origin --tags']);
    
    cd(oldDir);