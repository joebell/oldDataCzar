%% getBranchList()
%
% Internal helper function.  Gets the list of current branches.
%
% JSB 3/2011
function branch = getBranchList()

    % Get the repository settings
    params = dataCzarSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);

    [status, text] = system('git branch');
    text = regexprep(text,'\(no branch\)','[TimeWarp]');
    branch.locals = regexp(text, '[*\w*\]*','match');
    
    starred = regexp(text, '* [*\w*\]*','match');
    current = regexprep(starred,'* ','');
    branch.current = current{1};

    
    [status, text] = system('git branch -r');
    deHeaded = regexprep(text, 'HEAD', '');
    deMastered = regexprep(deHeaded, 'master', '');
    deOrigined = regexprep(deMastered,'origin/','');
    branch.remotes = regexp(deOrigined,'\w*','match');
    
    % Find untracked remotes
    branch.unTrackedRemotes = {};
    numUntracked = 0;
    for remote = 1:size(branch.remotes,2)
        
        tracked = false;
        for local = 1:size(branch.locals,2)
            if strcmp(branch.remotes{remote},branch.locals{local})
                tracked = true;
            end
        end
        if ~tracked
            numUntracked = numUntracked + 1;
            branch.unTrackedRemotes{numUntracked} = branch.remotes{remote};
        end
    end
    
    cd(oldDir);