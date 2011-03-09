%% getRepository.m
%
function repoName = getRepository()


    % Get the repository settings
    params = dataCzarSettings();
       
    repoName = params.yourRepository;
 