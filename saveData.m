%% saveData.m
%
%  Use this as a replacement for MATLAB's save() command.  This saves 
%  your data to disk, but it also saves metadata like the time you're 
%  saving, the current version of the code tracked by dataCzar, and whether 
%  the file has been backed up.
%
%  Just like save(), this will overwrite an existing file on disk without 
%  prompting you.
%
%  Ex:  saveData('fileName', 'variableName1', 'variableName2', ...) 
%
%  JSB 3/2011
function saveData(fileName,varargin)

	expName = '';
	saveExperimentData(expName,fileName,varargin);

