function obj = query(repoPath)
% Peform the query of a Git repo
%
% This function populates the values of a GitInfo object and returns the object it creates. The information is retrieved
% from several different git commands.
%
% Inputs:
%   repoPath: A string pointing to a Git repository
%
% Outputs:
%   obj: The filled out GitInfo object
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


%% Setup
% Here, we'll do some basic configuration for the function.

import MatLib.git.*

repoPath = MatLib.util.validateProperty(repoPath, {'char'}, {'vector'});
if ~checkIsGitRepo(repoPath)
    error('The path specified does not point to a Git repository');
end

% Construct the object to return
obj = GitInfo();

%% Get repo URL

cmdStr = genCmdStr(repoPath, 'remote --v');
[~, output] = system(cmdStr);
output = cleanOutput(output);

url = strsplit(output{1}); url = strtrim(url{2});
obj.repoUrl = url;

%% Get local branch information

cmdStr = genCmdStr(repoPath, 'branch');
[~, output] = system(cmdStr);
output = cleanOutput(output);

% Locate the index of the current branch -- it has an asterisk next to its name
curBranchIdx = find(cellfun(@(x) ~isempty(x) && strcmp(x(1), '*'), output), 1, 'first');

% Clean all the branch names
output = cellfun(@(x) cleanBranchName(x), output, 'UniformOutput', false);

% Set the local branch names
obj.localBranches = output;

% Set the current branch name
obj.currentBranch = obj.localBranches{curBranchIdx};

%% Get remote branch information

cmdStr = genCmdStr(repoPath, 'branch -r');
[~, output] = system(cmdStr);

% Clean all the branch names
output = cellfun(@(x) cleanBranchName(x), cleanOutput(output), 'UniformOutput', false);

% Set the remote branch names
obj.remoteBranches =  output;

%% Get last commit info

cmdStr = genCmdStr(repoPath, 'log --max-count=1');
[~, output] = system(cmdStr);
output = cleanOutput(output);

% The commit hash is on the first line, after the first (and only) space ('Commit: ...')
commitLine = strtrim(strsplit(output{1}));
obj.currentHash = commitLine{2};

% The author is on the second line ('Author: First Last email')
authorLine = strsplit(output{2});
obj.lastModifiedAuthor = strjoin(authorLine(2:3), ' ');

% The date is on the third line, and has an interesting (but still usable) format ('Date: ...')
commitDate = strtrim(strsplit(output{3}));
commitDate = datenum(strjoin(commitDate(2:end-1), ' '), 'ddd mmm dd HH:MM:SS yyyy');
obj.lastModifiedDate = datestr(commitDate, 'yyyy-mm-dd HH:MM:SS');


%% Helper Functions
function output = cleanOutput(output)
% Inputs:
%   output: The output of a system() call, a string
%
% Outputs:
%   output: The input, but reformatted into a cell of strings (one cell per non-empty line of text)
%
output = strsplit(output, '\n');
output = output(cellfun(@(x) ~isempty(x), output));

function str = cleanBranchName(str)
% Inputs:
%   str: The unprocessed string for a branch name
%
% Outputs:
%   str: The input with asterisks removed and insignificant whitespace trimmed
%
str = strtrim(strrep(str, '*', ''));
