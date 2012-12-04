%% listRecent.m
%
%  Lists the contents of dataCzar's data index.  It can take multiple 
%  types of inputs:
%
%       listData();                  % Show everything you've got!
%       listData(3);                 % The index number of a file
%       listData(1,2,5:7);           % A bunch of index numbers
%       listData('ExperimentName');  % Just data from one experiment
%
%  It will first list all in-range files, then will list files that are
%  currently not backed-up either locally or remotely.  (Locally backed-up
%  files are listed with an "L", remotely backed-up files have an "R")
%
% JSB 3/2011 
function listRecent(varargin)

    % Load the index
    dmIndex = loadDmIndex();
	mostRecent = size(dmIndex.files,2);
	if (nargin < 1)
		list = (mostRecent - 100):mostRecent;
	else
		list = (mostRecent - varargin{1}):mostRecent;
	end

	listData(list);

