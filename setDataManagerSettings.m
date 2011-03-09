%% setDataManagerSettings.m
% 
%  Use this program to write settings for the dataManager package.
%  Edit the variable def's below, then run the script.
%
%  JSB 12/2010
%
function setDataManagerSettings()

%% Settings - Edit these!
% Mac Settings
%     dmSettings.dataManagerDir = '~/Desktop/dataManager/';
%     dmSettings.dataDir = '~/Desktop/Data/dataManager/';
% PC Settings
    dmSettings.dataManagerDir = 'C:\Documents and Settings\Joe Bell\Desktop\Code\dataManager\';
    dmSettings.dataDir = 'C:\Documents and Settings\Joe Bell\Desktop\Data\Recordings\';
%     dmSettings.localBackup = false;       % Backup to some local directory
%     dmSettings.localBackupDir = '';
    dmSettings.smbBackup = true;          % Use smb to backup
%    dmSettings.smbDir = '/Volumes/neurobio/Wilson Lab/Joe Bell/Data/';
    dmSettings.smbDir = '\\Files.med.harvard.edu\neurobio\Wilson Lab\Joe Bell\Data\Recordings\';

%% Script - Don't edit this unless you're awesome.
    % Create index file if there isn't one already
    if ~exist('.dmIndex.mat')
        dmIndex = [];
        save([dmSettings.dataManagerDir,'.dmIndex.mat'],'dmIndex');
    end
    
    % Save settings
    save([dmSettings.dataManagerDir,'.dmSettings.mat'],'dmSettings');
    disp(['Wrote dataManager Settings to: ',dmSettings.dataManagerDir]);
    
    
