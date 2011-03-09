%% makeBackup.m
%
%  Updates the local and remote backups if needed.
%
%  JSB 1/2011
function makeBackup()

    makeLocalBackup();
    makeRemoteBackup();
    