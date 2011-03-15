%% startRepository.m
%
% Use this to add a new repository for dataCzar.  It can either be a new
% empty repository, or an existing one that's already stored on the server.
%
% You'll do steps 1-4 the first time you create a repository.
% Then you can just do steps 5-8 for each additional respository.
%
% (1) Download git from http://www.git-scm.com/ and install. Then reboot.
%     Make sure that git gets added to the system path.
%
% (2) Setup an account at http://www.github.com  This is the website that
%     hosts our code.
%
% (3) Associate public keys of your computer with your github account.
%     These are used to authenticate your identity.  You'll need to do 
%     this for each computer you use.  Instructions: 
%            http://help.github.com/msysgit-key-setup/   (for Windows)
%            http://help.github.com/mac-key-setup/       (for Mac OS X)
%     Do not create a passphrase.  (Just hit enter to leave a blank one.)
%
% (4) If you don't have dataCzar already, download it from: 
%     https://github.com/joebell/dataCzar   and install it by running the
%     installDataCzar.m script.  (Make sure you edit the settings at the
%     top to supply appropriate directories for your machine.) 
%
%
%
%
% (5) If you're cloning someone else's code to collaborate with them,
%     contact them to give you permission to access it.  Otherwise create 
%     a new repository of your own on GitHub.  (http://www.github.com) All
%     you'll have to enter is a project name (like 'dataCzar') and click
%     'Create Repository'.  You don't need to follow any of the git
%     initialization instructions.
%
% (6) If you're setting up your own repository then in the settings below 
%     make sure: existingRepository = false.  If there's already a
%     repository on the server with code you want to get then:
%     existingRepository = true;
%
% (7) Set: yourRepository = 'yourProjectName';
%
% (8) Run this script.
%
function startRepository()

%% Settings - Modify these please!
 

    existingRepository = true;   % Set this to true if you're cloning a
                                 % repository that already exists   
                                 
    yourRepository = 'arduinoMATLAB';    % Your repository
   

    
%% The script.  You probably shouldn't modify this unless you're awesome. 

    dcSettings = dataCzarSettings();
    dcSettings.yourRepository = yourRepository;   
    dcSettings.repoDir = [dcSettings.workingDir,...
				dcSettings.yourRepository,'/'];

    % Set global git settings
    system(['git config --global user.name "',dcSettings.yourName,'"']);
    system(['git config --global user.email ',dcSettings.yourEmail]);    
           
    % Go to working directory
    cd(dcSettings.workingDir);
    
    % If there's already a repo, just clone it
    if (existingRepository)
        disp('Cloning an existing distribution...');
        system(['git clone git@github.com:',...
            dcSettings.repoOwner,'/',...
            dcSettings.yourRepository,'.git']);
        
    % Otherwise construct a new one
    else
        % Make a directory and initialize
        mkdir(dcSettings.yourRepository);
        cd(dcSettings.yourRepository);
        system('git init');

        % Add a README file
        myFile = fopen('README','w');
        fprintf(myFile, '% README \n');
        fclose(myFile);
        system(['git add README']);

        % Commit to the server
        system(['git commit -m "first commit"']);
        system(['git remote add origin git@github.com:',...
            dcSettings.repoOwner,'/',dcSettings.yourRepository,...
            '.git']);
        system(['git push origin master']);
    end
    
    % Save settings 
    save([dcSettings.dataCzarDir,'.dataCzarSettings.mat'],'dcSettings');
   
    % Update the MATLAB path to contain newly created directories
    updatePath();
    
    % Placed after settings and path to allow cloning simpleGit
    if (existingRepository)
        cloneRemoteBranches();
        updateToServer('Cloned out.');
    end
    
    % Display a completion message and leave us in workingDir.
    disp(['-- Set-up repository ',dcSettings.yourRepository, ...
        ' in folder ',dcSettings.workingDir,dcSettings.yourRepository,...
        ' --']);   
    cd(dcSettings.workingDir);

