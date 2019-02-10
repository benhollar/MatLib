function cmdStr = genCmdStr(repoPath, funcStr)
% A simple helper function to help generate a Git command
%
%cmdStr = genCmdStr(repoPath, funcStr)
%
% Inputs:
%   repoPath: The filepath to the repository; the command will -C into this location
%   funcStr: An arbitrary string to append to the template; this should be the body of the request (e.g. 'fetch', 'log')
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


cmdStr = sprintf('"%s" --no-pager -C "%s" %s', MatLib.git.findGit(), repoPath, funcStr);
