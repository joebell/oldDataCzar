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

%% Example directories for Unix - edit these!
   dcSettings.workingDir  = '~/Desktop/Code/';
   dcSettings.dataCzarDir = '~/Desktop/Code/dataCzar/';
   dcSettings.dataDir     = '/data/dataCzar/';
   dcSettings.remoteRsyncOptions = '-rite ssh';
   dcSettings.remoteRsyncHost = 'transfer:/groups/wilson/RTPW/dataCzar/';
   dcSettings.remoteRsyncBackup = true;
   dcSettings.yourRepository = 'laserTrack2';
   dcSettings.repoDir        = '~/Desktop/Code/laserTrack2/';
   

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
%% Script to install dataCzar.  Don't edit this unless you're awesome

    % Save settings to a hidden file (so they won't be synced)
    save([dcSettings.dataCzarDir,'.dataCzarSettings.mat'],'dcSettings');
    disp('Saved: .dataCzarSettings.mat');
    
    % Update the MATLAB path
    % addpath(genpath([dcSettings.dataCzarDir]));
    % savepath;   
    % disp('Updated MATLAB path for dataCzar.');
    % disp(['dataCzar installed to: ',dcSettings.dataCzarDir]);
    
    % Create index file if there isn't one already
    if ~exist([dcSettings.dataDir,'.dmIndex.mat'])
        dmIndex = [];
        save([dcSettings.dataDir,'.dmIndex.mat'],'dmIndex');
        disp('Created a new data index file.');
    else
		disp('Using a previously created .dmIndex file');
	end

    
       
