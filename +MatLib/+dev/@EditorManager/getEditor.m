function editor = getEditor(~)
% Helper to retrieve the handle to the MATLAB editor application
%
%editor = obj.getEditor()
%
% This private method simply hides the hard-to-remember MATLAB class into an easy-to-remember method name. If MATLAB
% decides to ever change the interface to get the editor, we could also perform version-specific actions here, which
% I'll omit doing for now. I believe the current approach works since MATLAB 7.
%
% Outputs:
%   editor: The handle to the MATLAB editor

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


% Simply get the editor
editor = com.mathworks.mlservices.MLEditorServices.getEditorApplication();
