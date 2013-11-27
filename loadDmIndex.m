% This can be used to load or save the dmIndex
% It retains the index in memory
function latestDmIndex = loadDmIndex(varargin)

    persistent dcSettings;
    persistent dmIndex;
    
    % If we're loading the dmIndex
    if (nargin == 0)
        % Retains the dmIndex in memory if it's already been loaded
        if (size(dmIndex,1) == 0)          
            dcSettings = dataCzarSettings();        
            % S = load([dcSettings.dataCzarDir,'.dmIndex.mat']);
			S = load([dcSettings.dataDir,'.dmIndex.mat']);
            dmIndex = S.dmIndex;
        end
    elseif (nargin == 1)        
        dmIndex = varargin{1};
		% disp(['Writing: ',dcSettings.dataCzarDir,'.dmIndex.mat']);
        % save([dcSettings.dataCzarDir,'.dmIndex.mat'],'dmIndex');
		save([dcSettings.dataDir,'.dmIndex.mat'],'dmIndex');
    end
    
    latestDmIndex = dmIndex;
    
