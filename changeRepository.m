%% changeRepository.m
%
%  Asks dataCzar to use a different repository on your system.
%
%  example: changeRepository('arduinoMATLAB');
%
%  Now whenever you run dataCzar commands they'll be operating on the
%  arduinoMATLAB repository.
%
%  JSB 12/2010
function changeRepository(repository)

    % Get the repository settings
    dcSettings = dataCzarSettings();
    
    dcSettings.yourRepository = repository;
    dcSettings.repoDir = [dcSettings.workingDir,repository,'/'];
    
    save([dcSettings.dataCzarDir,'.dataCzarSettings.mat'],'dcSettings');
    
    disp(['Pointed dataCzar at repository: ',repository,' in ',dcSettings.repoDir]);
    
    listBranches();