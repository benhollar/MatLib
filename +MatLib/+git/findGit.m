function gitPath = findGit()
% Find the Git executable location
%
%gitPath = findGit()
%
% Outputs:
%   gitPath: The path of the Git executable as a string; if not found, returns empty
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


% The command is different between Windows and Unix systems.
if ispc()
    [status, output] = system('where git');
else
    [status, output] = system('which git');
end

gitPath = '';
if status == 0
    gitPath = strtrim(output);
end
