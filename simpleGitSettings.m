%% simpleGitSettings.m
%

function gitSettings = simpleGitSettings()

    pathToSimpleGitF = which('simpleGitSettings');
    pathToSimpleGit = regexprep(pathToSimpleGitF,'simpleGitSettings.m','');
    load([pathToSimpleGit,'.gitSettings.mat']);
