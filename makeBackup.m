%% makeBackup.m
%
%  Updates the local and remote backups if necessary to make them current.
%
%  JSB 1/2011
function makeBackup()

    makeLocalBackup();
    makeRemoteBackup();
    