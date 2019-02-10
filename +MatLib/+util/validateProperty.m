function varargout = validateProperty(value, validClasses, validAttributes, varargin)
% Validate an input
%
%validateProperty(value, validClasses, validAttributes)
%validateProperty(value, validClasses, validAttributes, allowsEmpty)
%value = validateProperty(...)
%
% This function forms a wrapper around MATLAB's built-in validateattributes function to conveniently check empty inputs
% in addition to the normal validation.
%
% Inputs:
%   value: Any value to be checked via validateattributes
%   validClasses: A cellstr of valid classes, to be passed directly to validateattributes
%   validAttributes: A cellstr of valid attributes, to be passed directly to validateattributes
%   allowsEmpty: (Optional) A logical indicating if empty values are allowed. If not specified, defaults true
%
% Outputs:
%   value: (Optional) The unmodified input value, for convenience
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


allowsEmpty = MatLib.util.parseInputs(varargin, true);

if allowsEmpty && isempty(value)
    return
end

if ~allowsEmpty && ~isempty(value)
    error('Value cannot be empty');
end

% Use the validateattributes function internally to do the heavy lifting
validateattributes(value, validClasses, validAttributes);

% Return the input if it was requested
if nargout > 0
    varargout{1} = value;
end
