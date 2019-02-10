function addpathRecursive(folder, root)
% As the name suggests, adds folders (and their subfolders) to the MATLAB path recursively.
%
% Inputs:
%   folder: folder to add
%   root: typically, the folder above the folder, which should already be on the MATLAB path.
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


import MatLib.util.addpathRecursive

if ~exist('root', 'var')
    root = folder;
end

foldersToAdd = dir(folder);
isDir = [foldersToAdd.isdir];
foldersToAdd = foldersToAdd(isDir);

for idx = 1:length(foldersToAdd)
    
    % Ignore the '.' and '..' folders
    if strcmp(foldersToAdd(idx).name, '.')
        continue;
    end
    if strcmp(foldersToAdd(idx).name, '..')
        continue;
    end
    
    % MATLAB designates folders that begin in '+' and '@' as packages and classes respectively, and they are
    % automatically added to the path if their containing directory is.
    if strcmp(foldersToAdd(idx).name(1), '+')
        continue;
    end
    if strcmp(foldersToAdd(idx).name(1), '@')
        addpath(root);
        continue;
    end
    
    addpathRecursive(foldersToAdd(idx).name, foldersToAdd(idx).name);
    addpath(fullfile(root, foldersToAdd(idx).name));
end

end
