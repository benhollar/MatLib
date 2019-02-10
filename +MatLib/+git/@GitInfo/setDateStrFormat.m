function setDateStrFormat(obj, datestrFormat)
% Update the formatting of date-related properties
%
%obj.setDateStrFormat(datestrFormat)
%
% Inputs:
%   datestrFormat: A valid datestr format, as defined by MATLAB's datestr() function
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


% I'm not even going to try validating this beyond it being a string, which I'll let the property validator do.
obj.datestrFormat = datestrFormat;

% Properties that reflect dates need updated.
obj.lastModifiedDate = datestr(obj.lastModifiedDate, datestrFormat);
