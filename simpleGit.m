%% simpleGit.m 
%
%  simpleGit is a wrapper for git to allow simple check-outs and commits of code
%  for the Wilson Lab.  It allows you to take snapshots of your code directory,
%  keep track of them, and then instantly restore them at any time.
%
%  startRepository()   - Use this script to setup or clone an new repo.
%
%  updateFromServer()  - Gets the most recent server code.
%
%  updateToServer(message) - Stores changes to the server.
%
%  changeRepository(repo) - Switches between different repositories.
%
%  listBranches()      - Shows available code branches on your system.
%
%  changeBranch(target) - Changes the working directory to reflect the
%                        target, which can either be a branch, or a commit
%                        version.
%
%  browseTree()         - Opens a web browser window that shows your
%                         current repository history.
%
%  makeBranch(name)     - Creates a new branch off the current state.
%
%  mergeBranch(target) - Merges the target with the current branch.
%
%  abortMerge()        - Use this if a merge fails.
%
%  useRemoteBranch(branch) - Used to import a server branch to your system.
%
%  cloneRemoteBranches() - Imports all remote server branches.
%
%  deleteBranch()      - Deletes a branch.
%
%  showLog()           - Displays recent commits.
%
%  makeTag(tagString)  - Tags the most recent commit, uploads to server.
%
%  listTags()          - Shows you all the tags available.  These can be
%                        used with changeBranch(tag).
%
%  isServerCurrent()   - Returns true if the server code is current.
%
%  getCodeVersion()    - Returns a string that uniquely identifies the
%                        current code version.  Note that if updates
%                        haven't been committed, then they won't be
%                        reflected in this.
%
%  updatePath()        - A helper function to update the MATLAB path when
%                        new code directories are downloaded.
%
%  simpleGitSettings() - A helper function that contains git settings.
%
%  graphicalGit()      - Opens a graphical browser of your repository.
%
%  git()	       - A wrapper to allow command-line use of git from the
%                        MATLAB command line.  Only for expert git users.
%
%  -- Using simpleGit --
%
%  Using simpleGit is simple:
%
%  (1) When you start working, run updateFromServer() to get any recent
%  changes to the code.  Don't worry if you've made your own changes -
%  simpleGit will merge them.
%
%  (2) Once you've made some changes you'd like to keep, run
%  updateToServer('your comments') to store your changes.  simpleGit will
%  assign the version of code you store a unique identifier like: 73e9572
%  that can be used to return to this version at any time!
%
%  (3) To return to a previous version run changeBranch('73e9572').  To get
%  back to where you were run changeBranch('master').  To point simpleGit
%  at a different repository, run changeRespository(reponame).  Running change
%  branch will swap out all of the code in your repository for the previous 
%  version.  It's like magic!
%
%  (4) If you want to try out a major change to your code, make a new
%  branch.  Run makeBranch('branchName') to create this.  This allows you to
%  return to the point at which you started branching at any time.
%
%  (5) You can switch between branches you've created at any time by
%  running changeBranch('branchName').  Get back to the default branch by
%  running changeBranch('master').  You can list all available branches by
%  running listBranches().
%
%  (6) If you want to merge two branches (keeping changes in both), use
%  mergeBranch(target).  If the merge fails for some reason, simpleGit will
%  annotated conflicting files for you to fix manually.  (Just open them up
%  and make them look how you want, then updateToServer.)  If you get
%  confused, just run abortMerge().
%
%  (7) If a collaborator makes branches from your code (nb. They can't do
%  this without your permission.) and you want to work on them, use
%  useRemoteBranch(branch) to import them, or get all of them with
%  cloneRemoteBranches().
%
%  (8) Return a timestamp of your current code by running getCodeVersion().
%  You can also ensure that it's current by running isServerCurrent().  You
%  can use these functions in your data acquisition or analysis scripts to
%  tag your data structures or figures with the code version that generated
%  them.  getCodeVersion() will display warnings if you run it without 
%  storing changes to your code.
%
%  (9) Get a graphical display of the version history by using
%  graphicalGit() or browseTree().
%
%   

function simpleGit()

    disp('This function is only used to store help. Try "help simpleGit".')
 
