function varargout = parseInputs(inputs, varargin)
% Parses optional inputs, matching omitted values to default values
%
%[...] = parseInputs(inputs, ...)
%
% This function is a bread-and-butter method to provide some sense of function overloading in MATLAB. Essentially, it
% takes a cell of arbitrary values and number of default values. If a particular input doesn't exist or is empty, it is
% matched to the default specified.
%
% Inputs:
%   inputs: An Mx1 cell array of arbitrary values. Generally, this should be the entirety of the varargin cell in
%       functions that use optional inputs
%   varargin: This is N seperate inputs defining default values for inputs. Note that there *can* be more default values
%       than inputs, but the number of defaults must equal the number of outputs requested
%
% Outputs:
%   varargout: N seperate output arguments
%
% The following example demonstrates the functionality. These lines return out1 = 1, out2 = 'hi', out3 = 'goodbye'
%   inputs = {1, []};
%   [out1, out2, out3] = parseInputs(inputs, 0, 'hi', 'goodbye')
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


%% Validate arguments

% Check that the length of the inputs cell matches the length of default values to furnish
if nargin - 1 ~= nargout
    error('The number of default values must match the number of requested outputs.');
end

% Check that the number of inputs does not exceed the number of requested outputs
if length(inputs) > nargout
    error('Not enough output arugments requested for inputs.');
end

%% Do the parsing

varargout = cell(1, nargout);
for idx = 1:length(inputs)
    
    if ~isempty(inputs{idx})
        % Pass out the value given
        varargout{idx} = inputs{idx};
    else
        % Pass out the default value
        varargout{idx} = varargin{idx};
    end
    
end

% If the number of inputs did not match the number of requested outputs, furnish the remainder of the default values
idx = length(inputs) + 1;
varargout(idx:nargout) = varargin(idx:nargout);
