%% startRepository.m
%
% You'll do steps 1-5 the first time you create a repository.
% Then you can just do steps 6-8 for each additional respository.
%
% (1) Download git from http://www.git-scm.com/ and install. Then reboot.
%     Make sure that git gets added to the system path.
% (2) Setup an account at http://www.github.com  This is the website that
%     hosts our code.
% (3) Associate public keys of your computer with your github account.
%     These are used to authenticate your identity.  You'll need to do 
%     this for each computer you use.  Instructions: 
%            http://help.github.com/msysgit-key-setup/   (for Windows)
%            http://help.github.com/mac-key-setup/       (for Mac OS X)
%     Do not create a passphrase.  (Just hit enter to leave a blank one.)
% (4) If you don't have simpleGit already, download it from: 
%     https://github.com/joebell/simpleGit   and install it by running the
%     installSimpleGit.m script.  (Make sure you edit the settings at the
%     top to supply appropriate directories for your machine.) 
% (5) See the startRepository.m script in simpleGit for detailed 
%     instructions on how to create a new repository or a clone of an
%     existing one.
% 
%  nb:
%     If you're trying to clone simpleGit, first install it into a temp
%     directory, then use this script to clone it.  Then delete the temp
%     directory and run installSimpleGit.m in the cloned copy to install.
%
%
% (6) If you're cloning someone else's code to collaborate with them,
%     contact them to give you permission to access it.  Otherwise create 
%     a new repository of your own on GitHub.  (http://www.github.com)
%
% (7) If you're setting up your own repository:
%   (7.1) Change the directory settings below to match your system.
%   (7.2) Make sure: existingRepository = false
%                    repoOwner = 'yourGitHubUserName' 
%                    yourRepository = 'yourRepositoryName'
%   (7.3) Run this script to install yourRepository.
% 
% (8) If you're importing someone's existing code:
%   (8.1) Change the directory settings below to match your system.
%   (8.2) Make sure: existingRepository = true
%                    repoOwner = 'ownersGitHubUserName' 
%                    yourRepository = 'theirRepositoryName'
%   (8.3) Run this script to install theirRepository.
%
%
function startRepository()

%% Settings - Modify these please!
 
    existingRepository = true;   % Set this to true if you're cloning a
                                 % repository that already exists

    gitSettings.yourName  = 'Joe Bell';
    gitSettings.yourEmail = 'joe.bell@gmail.com';
    gitSettings.repoOwner = 'joebell';                % A GitHub username
    gitSettings.yourRepository = 'ePhys';     % Your repository
    
% Sample directory settings for a PC
%    gitSettings.workingDir = 'C:\Documents and Settings\Joe Bell\Desktop\';
%    gitSettings.simpleGitDir = 'C:\Documents and Settings\Joe Bell\Desktop\simpleGit\';

% Sample directory settings for a Mac
    gitSettings.workingDir = '~/Desktop/';
    gitSettings.simpleGitDir = '~/Desktop/simpleGit/';


    gitSettings.repoDir = [gitSettings.workingDir,...
				gitSettings.yourRepository,'/'];
    
%% The script.  You probably shouldn't modify this unless you're awesome. 

    % Set global git settings
    system(['git config --global user.name "',gitSettings.yourName,'"']);
    system(['git config --global user.email ',gitSettings.yourEmail]);    
           
    % Go to working directory
    cd(gitSettings.workingDir);
    
    % If there's already a repo, just clone it
    if (existingRepository)
        disp('Cloning an existing distribution...');
        system(['git clone git@github.com:',...
            gitSettings.repoOwner,'/',...
            gitSettings.yourRepository,'.git']);
        
    % Otherwise construct a new one
    else
        % Make a directory and initialize
        mkdir(gitSettings.yourRepository);
        cd(gitSettings.yourRepository);
        system('git init');

        % Add a README file
        myFile = fopen('README','w');
        fprintf(myFile, '% README \n');
        fclose(myFile);
        system(['git add README']);

        % Commit to the server
        system(['git commit -m "first commit"']);
        system(['git remote add origin git@github.com:',...
            gitSettings.repoOwner,'/',gitSettings.yourRepository,...
            '.git']);
        system(['git push origin master']);
    end
    
    % Save git settings 
    save([gitSettings.simpleGitDir,'.gitSettings.mat'],'gitSettings');
   
    % Update the MATLAB path to contain newly created directories
    updatePath();
    
    % Placed after settings and path to allow cloning simpleGit
    if (existingRepository)
        cloneRemoteBranches();
        updateToServer('Cloned out.');
    end
    
    % Display a completion message and leave us in workingDir.
    disp(['-- Set-up repository ',gitSettings.yourRepository, ...
        ' in folder ',gitSettings.workingDir,gitSettings.yourRepository,...
        ' --']);   
    cd(gitSettings.workingDir);

