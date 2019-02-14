function rgb = toRgb(obj)
% This function converts a Color object to a normalized (0-1) RGB triplet
%
% Outputs:
%   rgb: The RGB triplet as a normalized (0-1) numeric
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


% The values are stored internally as RGB, so this is exceedingly simple.
rgb = [obj.r, obj.g, obj.b];
