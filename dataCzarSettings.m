%% dataCzarSettings.m
%
%
function dcSettings = dataCzarSettings()

    pathToDZF = which('dataCzarSettings');
    pathToDZ = regexprep(pathToDZF,'dataCzarSettings.m','');
    load([pathToDZ,'.dataCzarSettings.mat']);