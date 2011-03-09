%% changeRepository
%
%  Asks simpleGit to use a different repository on your system.
%
%  example: changeRepository('arduinoMATLAB');
%
%  Now whenever you run simpleGit commands they'll be operating on the
%  arduinoMATLAB repository.
%
%  JSB 12/2010
function changeRepository(repository)

    % Get the repository settings
    gitSettings = simpleGitSettings();
    
    gitSettings.yourRepository = repository;
    gitSettings.repoDir = [gitSettings.workingDir,repository,'/'];
    
    save([gitSettings.simpleGitDir,'.gitSettings.mat'],'gitSettings');
    
    disp(['Pointed simpleGit at: ',repository,' in ',gitSettings.repoDir]);
    
    listBranches();