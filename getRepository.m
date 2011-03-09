%% getRepository.m
%
% Returns the name of the current repository.
%
% JSB 3/2011
function repoName = getRepository()


    % Get the repository settings
    params = dataCzarSettings();
       
    repoName = params.yourRepository;
 