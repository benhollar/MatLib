function allFiles = searchDir(rootDir, varargin)
% Search a directory for files
%
% Even though a number of good "better dir()" functions exist in the world, I typically use my own unless I need
% something super fancy. This function performs a search through a directory for files. Optionally, the search can be
% tailored mildly.
%
% Inputs:
%   rootDir: The root filepath to begin the search
%   goodExt: (Optional) A cell of strings specifiying extensions to search for. Defaults to empty (all files)
%   doRecursion: (Optional) A logical indicating if the search should recurse on subfolders
%
% Outputs:
%   allFiles: The list of files found, as full system filepaths
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


%% Setup

% Get the optional inputs
[goodExt, doRecursion] = MatLib.util.parseInputs(varargin, [], true);

% Make sure everything is a good type
rootDir = MatLib.util.validateProperty(rootDir, {'char'}, {'vector'});
goodExt = MatLib.util.validateProperty(goodExt, {'cell'}, {'vector'});
doRecursion = MatLib.util.validateProperty(doRecursion, {'logical'}, {'scalar'});

% Intialize our file list; hard to preallocate here, no known number of files to return
allFiles = {};


%% Do the search 
% Effectively, search each directory until out of directories to search.

dirsToCheck = {rootDir};
while ~isempty(dirsToCheck)
    curDir = dirsToCheck{1}; dirsToCheck(1) = [];
    dirContents = filterContents(dir(curDir));
    
    filesFound = getNames(dirContents(~[dirContents.isdir]));
    filesToKeep = filterExt(filesFound, goodExt);
    allFiles = [allFiles, filesToKeep]; %#ok<AGROW>
    
    % Only add to our list of directories to search if the function is allowed to recurse
    if doRecursion
        dirsFound = getNames(dirContents([dirContents.isdir]));
        dirsToCheck = [dirsToCheck, dirsFound];  %#ok<AGROW>
    end
    
end


%% Helper functions
function names = getNames(dirContents)
% Get the full system names of the contents given
%
% Inputs:
%   dirContents: The return value of a dir() call
%
% Outputs:
%   names: The full system filepaths found
%
names = {dirContents.name};
folders = {dirContents.folder};
names = cellfun(@(x, y) fullfile(x, y), folders, names, 'UniformOutput', false);

function dirContents = filterContents(dirContents)
% Remove garbage from a dir() call
%
% Inputs:
%   dirContents: The return value of a dir() call
%
% Outputs:
%   dirContents: The filtered input
%
names = {dirContents.name};
ignore = {'.', '..'};
dirContents = dirContents(cellfun(@(x) ~any(strcmp(x, ignore)), names));

function names = filterExt(names, goodExt)
% Remove all but requested extensions from list of files
%
% Inputs:
%   names: A cell of strings specifying the file locations
%   goodExt: A cell of strings specifying the extensions to keep. If empty, keep all
%
% Outputs:
%   names: The filtered input
%
if isempty(goodExt)
    return
end

badIdx = false(1, length(names));
for idx = 1:length(names)
    [~, ~, ext] = fileparts(names{idx});
    if ~any(strcmp(ext, goodExt))
        badIdx(idx) = true;
    end
end
names = names(~badIdx);
