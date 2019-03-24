function closeAll(obj)
% Closes all (non-whitelisted) files in the editor
%
%obj.closeAll()
%
% This function is primarily useful for closing a bunch of files in bulk, or when paired with also opening a number of
% files (as if to quickly switch tasks). It grabs each open file in the editor and compares it to the EditorManager's
% known list of whitelisted files to keep open at all times. If a file is not in that list, this function closes it.
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


% From the editor, get the list of open editors (the open files)
editor = obj.getEditor();
openEditors = editor.getOpenEditors().toArray();

for idx = 1:length(openEditors)
    % We need to check both the filename of the file and the full system path of the file against our whitelist. If we
    % find a match, skip this one.
    if any(strcmp(openEditors(idx).getShortName(), obj.whitelistedFiles))
        continue;
    end
    if any(strcmp(openEditors(idx).getLongName(), obj.whitelistedFiles))
        continue;
    end
    
    % If we're here, we're good to close it.
    openEditors(idx).close();
    
end
