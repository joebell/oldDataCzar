%% restoreSimpleGitSettings.m
%
function restoreSimpleGitSettings()

    gitSettings.yourName = 'Joe Bell';
    gitSettings.yourEmail = 'joe.bell@gmail.com';
    gitSettings.repoOwner = 'joebell';
%    gitSettings.workingDir = 'C:\Documents and Settings\Joe Bell\Desktop\';
%    gitSettings.simpleGitDir = 'C:\Documents and Settings\Joe Bell\Desktop\simpleGit\';
     gitSettings.workingDir = '~/Desktop/';
     gitSettings.simpleGitDir = '~/Desktop/simpleGit/';
    gitSettings.yourRepository = 'simpleGit';
    gitSettings.repoDir = [gitSettings.workingDir,gitSettings.yourRepository,'/'];
    
    % Save git settings 
    save([gitSettings.simpleGitDir,'.gitSettings.mat'],'gitSettings');