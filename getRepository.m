%% getRepository.m
%
function repoName = getRepository()


    % Get the repository settings
    params = simpleGitSettings();
       
    repoName = params.yourRepository;
 