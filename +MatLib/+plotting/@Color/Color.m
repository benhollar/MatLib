classdef Color
% An enumeration class defining a variety of useful colors for convenience
%
% This class stores an enumeration of common colors for use in a variety of color spaces. The colors are arranged into a
% few categories:
%   - The "pure" colors (those who can be comprised of normalized RGB values of only 0 or 1). These colors include
%       "Red", "Green", "Blue", "Yellow", "Cyan", "Magenta", "Black" and "White"
%   - MATLAB default colors; this is actually composed of two sub-categories:
%       - The default colors for MATLAB's HG2 (handle graphics 2) based plotting; these colors are prefixed with
%           "Default" in the enum, and are the colors cycled through when plotting values in versions R2014b to present
%       - The default colors for MATLAB's HG1 (handle graphics 1) base plotting; these colors are prefixed with "Orig"
%           in the enum, and are the colors used when plotting values in versions R2014a and prior
%   - The HTML "16 named colors" (https://www.december.com/html/spec/color16codes.html). These colors are prefixed by
%       "Html" in the enum
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


%% Private properties
% Because this class is both an enumeration class *and* a value class (does not derive from handle), the meaning of a
% private property is a little different. Simply, we make the property irretrievable, but its SetAccess must remain
% immutable rather than private.
properties (GetAccess = private, SetAccess = immutable)
    
    % The red component of the color, a normalized RBG value from 0-1
    r;
    
    % The green component of the color, a nomralized RGB value from 0-1
    g;
    
    % The blue component of the color, a normalized RGB value from 0-1
    b;
    
end


%% Constructor
methods
    
    function obj = Color(r, g, b)
        % The constructor for the enumeration values
        %
        %obj = Color(r, g, b)
        %
        % Note that this constructor cannot be used by external entities, only the enum fields. We store colors of this
        % class internally as normalized RGB values (0-1 rather than 0-255), so values passed in must conform to that
        % expectation.
        %
        % Inputs:
        %   r: The red component, a numeric value 0-1
        %   g: The green component, a numeric value 0-1
        %   b: The blue component, a numeric value 0-1
        
        % Simply set the values
        obj.r = r;
        obj.g = g;
        obj.b = b;
    end
    
end

%% Enumeration
% The sections below list the values this class can represent; they are described in the class help text above.

enumeration
    
    %% The pure colors
    
    Red     (1, 0, 0);
    Green   (0, 1, 0);
    Blue    (0, 0, 1);
    Yellow  (1, 1, 0);
    Cyan    (0, 1, 1);
    Magenta (1, 0, 1);
    Black   (0, 0, 0);
    White   (1, 1, 1);
    
    %% The MATLAB HG2 default colors (R2014b to present)
    
    DefaultRed    (0.6350, 0.0780, 0.1840);
    DefaultGreen  (0.4660, 0.6740, 0.1880);
    DefaultBlue   (0.0000, 0.4470, 0.7410);
    DefaultOrange (0.8500, 0.3250, 0.0980);
    DefaultYellow (0.9290, 0.6940, 0.1250);
    DefaultPurple (0.4940, 0.1840, 0.5560);
    DefaultCyan   (0.3010, 0.7450, 0.9330);
    
    %% The MATLAB HG1 default colors (R2014a and earlier)
    
    OrigRed    (1.00, 0.00, 0.00);
    OrigGreen  (0.00, 0.50, 0.00);
    OrigBlue   (0.00, 0.00, 1.00);
    OrigCyan   (0.00, 0.75, 0.75);
    OrigPurple (0.75, 0.00, 0.75);
    OrigYellow (0.75, 0.75, 0.00);
    OrigGray   (0.25, 0.25, 0.25);
    
    %% The HTML "16 Named Colors"
    % See https://www.december.com/html/spec/color16codes.html
    
    HtmlBlack   (0.00, 0.00, 0.00);
    HtmlGray    (0.50, 0.50, 0.50);
    HtmlSilver  (0.75, 0.75, 0.75);
    HtmlWhite   (1.00, 1.00, 1.00);
    HtmlMaroon  (0.50, 0.00, 0.00);
    HtmlRed     (1.00, 0.00, 0.00);
    HtmlOlive   (0.50, 0.50, 0.00);
    HtmlYellow  (1.00, 1.00, 0.00);
    HtmlGreen   (0.00, 0.50, 0.00);
    HtmlLime    (0.00, 1.00, 0.00);
    HtmlTeal    (0.00, 0.50, 0.50);
    HtmlAqua    (0.00, 1.00, 1.00);
    HtmlNavy    (0.00, 0.00, 0.50);
    HtmlBlue    (0.00, 0.00, 1.00);
    HtmlPurple  (0.50, 0.00, 0.50);
    HtmlFuschia (1.00, 0.00, 1.00);
    
end
    
    
end
