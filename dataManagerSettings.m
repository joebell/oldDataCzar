%% dataManagerSettings.m
%
function dmSettings = dataManagerSettings()

    pathToDMF = which('dataManagerSettings');
    pathToDM = regexprep(pathToDMF,'dataManagerSettings.m','');
    load([pathToDM,'.dmSettings.mat']);