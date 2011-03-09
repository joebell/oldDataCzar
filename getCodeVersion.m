%% getCodeVersion.m
%
%  Now will force an auto-update if the backup isn't current
%
% JSB 1/2011
function code = getCodeVersion()


    % Get the repository settings
    params = simpleGitSettings();
    
    % Git needs to run from the working directory
    oldDir = cd(params.repoDir);
    
    % If the server isn't current, update it
    if ~isServerCurrent()
        disp(' ');
        disp('-- getCodeVersion() is forcing an auto-update --');
        disp(' ');
        updateToServer(['Auto-update: ',datestr(now)]);
    end
       
    if ismac
        [status, hash] = system(['git show HEAD -s --format=%H | cat']);
    else
        [status, hash] = system(['git show HEAD -s --format=%H ']);
    end
    
    hash = regexprep(hash,'\n','');
    repoName = getRepository();
    
    % Store the names of the files in the callstack
    callStack = dbstack();
    myStack = {};
    for i=2:size(callStack,1)
        myStack{i-1} = callStack(i).file;
    end
    
    % Store the relevant info
    code.filesCalled = myStack;   
    code.repository = repoName;
    code.version = hash;
    code.isCurrent = isServerCurrent();  % Kept in case the server was down
    
    cd(oldDir);