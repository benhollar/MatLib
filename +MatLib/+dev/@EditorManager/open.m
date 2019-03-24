function open(~, location)
% Open every .m file in a given location
%
%obj.open(location)
%
% This function allows easily opening a number of files given some location. The location can be the name of a file on
% the path (in which case we open the contents of the containing directory) or a file path to a directory.
%
% Inputs:
%   location: The system location, either as the name of a file on the MATLAB path, or a full directory file path
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


% Validate the input is a string
location = MatLib.util.validateProperty(location, {'char'}, {'vector'});

% Determine the directory we'll be opening
if isdir(location)
    dirToOpen = location;
else
    dirToOpen = fileparts(which(location));
    if isempty(dirToOpen)
        warning('Unable to find file "%s". No files will be opened.', location);
        return
    end
end

% Open the files in the editor
filesToOpen = MatLib.util.searchDir(dirToOpen, {'.m'});
for idx = 1:length(filesToOpen)
    edit(filesToOpen{idx});
end
