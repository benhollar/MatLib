function hsv = toHsv(obj)
% This function converts a Color object to a normalized (0-1) RGB triplet
%
% Outputs:
%   hsv: The hsv triplet
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


% Grab the RGB triplet for convenience
rgb = [obj.r, obj.g, obj.b];

% v is the maximum of the normalized RGB
[v, maxIdx] = max(rgb);

% Compute the max(RGB) - min(RGB) change for convenience
delta = v - min(rgb);

% s = (max(RGB) - min(RGB)) / max(RGB)
if v ~= 0
    s = delta / v;
else
    s = 0;
end

% h changes depending on the max of RGB, and is always multiplied by 60 degrees
if maxIdx == 1
    h = (rgb(2) - rgb(3)) / delta;
elseif maxIdx == 2
    h = 2 + (rgb(2) - rgb(1)) / delta;
else
    h = 4 + (rgb(1) - rgb(2)) / delta;
end
h = h * 60;
if h < 0
    h = h + 360;
end

% Package the results
hsv = [h, s, v];
