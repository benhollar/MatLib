function tf = checkIsGitRepo(repoPath)
% A simple helper function to check if a filepath points to a Git repository
%
%tf = checkIsGitRepo(repoPath)
%
% Inputs:
%   repoPath: The filepath to the folder to check
%
% Outputs:
%   tf: The logical value of the check
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


% This command will fail if it's not a repository (frustratingly doesn't print false), but if it is a repository it
% simply prints 'true'
cmdStr = genCmdStr(repoPath, 'rev-parse --is-inside-work-tree');
[~, output] = system(cmdStr);

tf = strcmp(strtrim(output), 'true');
