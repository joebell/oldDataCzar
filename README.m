%% README for dataCzar
%
%  dataCzar is a MATLAB software package designed to facilitate the control of 
%  different versions of code, the timely and reliable backup of data, and 
%  record keeping about which code versions data was acquired with. 
%
%  A brief tutorial on using dataCzar follows.  For help on any command, at
%  the MATLAB command prompt just type 'help ' followed by the name on any
%  dataCzar command.  Ex: 'help listBranches'
%
%  These instructions assume that you've already downloaded dataCzar,
%  run the installDataCzar script, and created a repository with
%  startRepository().  
%
%
%% Code Version Control In 10 Easy Steps
%---------------------------------------------
%
%  (1) When you start working, run updateFromServer() to get any recent
%  changes to the code.  Don't worry if you've made your own changes -
%  dataCzar will merge them.
%
%  (2) Once you've made some changes you'd like to keep, run
%  updateToServer('your comments') to store your changes.  dataCzar will
%  assign the version of code you store a unique identifier like: 73e9572
%  that can be used to return to this version at any time!
%
%  (3) To return to a previous version run changeBranch('73e9572').  To get
%  back to where you were run changeBranch('master').  To point dataCzar
%  at a different repository, run changeRespository('reponame').  Running 
%  changeBranch() will swap out all of the code in your repository for the 
%  previous version.  It's like magic!
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
%  mergeBranch('targetBranch').  If the merge fails for some reason, 
%  dataCzar will annotate conflicting files for you to fix manually.  
%  (Just open them up and make them look how you want, then updateToServer.)  
%  If you get confused, just run abortMerge().
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
%  them.  If your code isn't currently synced with the server, dataCzar will
%  automatically update the server for you if you're connected to the web.
%
%  (9) Get a graphical display of the version history by using
%  graphicalGit() or browseTree().
%
%  (10) You can easily tag a figure with the version of the code that 
%  generated it by running codeStampFigure(gcf);  It applies text discreetly
%  in the lower right-hand corner that can be moved and resized.
%
%
%
%% Data Backup
%--------------
%
% (1) MATLAB uses the save('filename','variableName',...); command to save
% data.  dataCzar gives you the option to use the saveData() command
% instead.  saveData() syntax is exactly the same as save(), but it keeps
% track of metadata associated with your files, including whether they've
% been backed up, and what version of code was used to acquire them.  You
% can also use saveExperimentData('Experiment Name', 'filename',
% 'variableName'); if you want to tag each file with the name of the 
% experiment it's associated with.
%
% (2) For a list of all your data, run listData();  It displays each file
% you've acquired, the date and time you saved it, and the experiment name.
% Each file gets a numerical index you can use to refer to it, and the list
% will indicate with an "L" if the file has been backed up locally, and an
% "R" if it's been backed up remotely.  All files that aren't backed up in
% two places (locally and remotely) are listed again at the bottom of the
% display.
%
% (3) To load your data, you can use the traditional MATLAB
% load('filename') syntax, or use dataCzar's loadData() syntax.  You can
% refer to a  data file by its number, or by its experiment name.  Of
% course, you can load multiple files in sequence by giving loadData() a
% list of numbers, or an experiment name containing multiple files.
%
% (4) For to see all the information about a file, use detailFile().  Refer
% to files in the same way as if you were using loadData().
%
% (5) dataCzar makes backing up data really easy.  Just run makeBackup()
% and dataCzar will take all files that aren't currently backed up and
% store them to a zip file on your local disk.  It will create a separate
% backup on the HMS server.  (Of course, if you're not connected to the
% server then the remote backup will fail.)  You can refer to subsets of
% data files by number or experiment name.  dataCzar only backs up stuff
% that hasn't previously been backed up.
%
% (6) After you're done with an experiment and want all the data in one
% place, you can use makeLocalArchive('experiment name'); to create a zip
% file with all the data associated with that experiment.
%
% (7) Use deleteFile() to remove files from the index.  It won't delete
% what's on disk.  
%
%

