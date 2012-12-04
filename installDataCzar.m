%% installDataCzar.m 
%
%  This script "installs" the dataCzar package.  Edit the settings to
%  reflect your usage, then run the script.  It will create a hidden file
%  that dataCzar uses, and adds the dataCzar directory to your MATLAB path.
%  
%  Take particular care to use the correct directories for a Mac or PC.
%
%  JSB 3/2011
function installDataCzar()


%% Settings - Edit these!

    dcSettings.yourName =  'Joe Bell';
    dcSettings.yourEmail = 'joe.bell@gmail.com';
    dcSettings.repoOwner = 'joebell';   % A GitHub username
    dcSettings.smbBackup =  true;       % Backup to server?


if ispc()    
%% Example directories for a PC - edit these!
   dcSettings.workingDir  = 'C:\Users\Wilson Lab\Desktop\Code\';
   dcSettings.dataCzarDir = 'C:\Users\Wilson Lab\Desktop\Code\dataCzar\';
   dcSettings.dataDir     = 'C:\Users\Wilson Lab\Desktop\Data\dataCzar\';
   dcSettings.smbDir = '\\Files.med.harvard.edu\neurobio\Wilson Lab\Joe Bell\Data\';
elseif isunix()
%% Example directories for Unix - edit these!
   dcSettings.workingDir  = '~/Desktop/Code/';
   dcSettings.dataCzarDir = '~/Desktop/Code/dataCzar/';
   dcSettings.dataDir     = '~/Desktop/Data/dataCzar/';
   dcSettings.smbDir = '\\Files.med.harvard.edu\neurobio\Wilson Lab\Joe Bell\Data\';
elseif ismac()
%% Example directories for a Mac - edit these!
     dcSettings.workingDir  = '~/Desktop/Code/';
     dcSettings.dataCzarDir = '~/Desktop/Code/dataCzar/';
     dcSettings.dataDir     = '~/Desktop/Data/dataCzar/';
     dcSettings.smbDir      = '/Volumes/neurobio/Wilson Lab/Joe Bell/Data/';
end

    

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%% Script to install dataCzar.  Don't edit this unless you're awesome

    % Save settings to a hidden file (so they won't be synced)
    save([dcSettings.dataCzarDir,'.dataCzarSettings.mat'],'dcSettings');
    disp('Saved: .dataCzarSettings.mat');
    
    % Update the MATLAB path
    addpath(genpath([dcSettings.dataCzarDir]));
    savepath;   
    disp('Updated MATLAB path for dataCzar.');
    disp(['dataCzar installed to: ',dcSettings.dataCzarDir]);
    
    % Create index file if there isn't one already
    if ~exist([dcSettings.dataCzarDir,'.dmIndex.mat'])
        dmIndex = [];
        save([dcSettings.dataCzarDir,'.dmIndex.mat'],'dmIndex');
        disp('Created a new data index file.');
    else
		disp('Using a previously created .dmIndex file');
	end

    
       
