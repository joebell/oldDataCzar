%% returnFileList.m
%
% Helper function.
%
% Generates a list of files to look through. For inputs:
% 	[none]	Returns all the files in the index
% 	[#'s]	Returns the same numbers
% 	[text]  Returns files matching this experiment name
%
% JSB 12/2010
function list = returnFileList(varargin)

    % Generate the list of files to look through
    if nargin > 0
        if isnumeric(varargin{1})
            list = varargin{1};
        else
            list = findExperiment(varargin{1});
        end
    else        
        % Load settings
        dcSettings = dataCzarSettings();

        % Load the index
        load([dcSettings.dataCzarDir,'.dmIndex.mat']);
        
        % Protect against empties
        if ~isfield(dmIndex,'files')
            disp('-- Empty dataCzar Index --');
            list = [];
            return;
        end
        list = 1:size(dmIndex.files,2);
    end
