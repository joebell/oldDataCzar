%% installSimpleGit.m
%
%  Edit the settings, then run this to install simpleGit before using it.
%
%  JSB 12/2010
function installSimpleGit()

%% Settings - Edit these!

    gitSettings.yourName = 'Joe Bell';
    gitSettings.yourEmail = 'joe.bell@gmail.com';
    gitSettings.repoOwner = 'joebell';  % A GitHub username
    
% Example directories for a PC
%    gitSettings.workingDir = 'C:\Documents and Settings\Joe Bell\Desktop\';
%    gitSettings.simpleGitDir = ['C:\Documents and Settings\Joe Bell\',...
%				'Desktop\simpleGit\'];

% Example directories for a Mac
    gitSettings.workingDir = '~/Desktop/';
    gitSettings.simpleGitDir = '~/Desktop/simpleGit/';

%% Script to install simpleGit

    % Save git settings to a hidden file (so they won't be synced)
    save([gitSettings.simpleGitDir,'.gitSettings.mat'],'gitSettings');
    disp('Saving .gitSettings.mat');
    
    % Update the MATLAB path
    addpath(genpath([gitSettings.simpleGitDir]));
    savepath;   
    disp('Updating MATLAB path for simpleGit...');
    disp(['simpleGit installed to: ',gitSettings.simpleGitDir]);
