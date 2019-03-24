classdef EditorManager < handle
% Class to easily manage the MATLAB editor
%
% This class provides a few utilities to easily work with the editor. As of now, one can:
%   - Quickly close all files in the editor (except those that are whitelisted)
%   - Quickly open every .m file in a directory for editing
%
% The currently implemented functionalities really focus on saving time switching between contexts. For example, you
% might juggle two separate projects and need to quickly jump to the one you're not working on. EditorManager makes this
% easy.
%
% Of course, MATLAB's editor exposes a lot more neat functionality we could take advantage of here. It's implemented in
% Java, so it's pretty easy to work with directly. This class could be easily expanded to offer a variety of
% editor-related shortcuts to make development just a little easier.
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


%% Public properties
% These properties can be freely read and modified by anyone.
properties
   
    % List of files to never automatically close
    %
    % A primary functionality of EditorManager is the ability to quickly close a long list of files and open others,
    % quickly switching contexts with ease. This property exists to allow control over which files are allowed to be
    % closed forcefully when doing so; files that appear in this list (either by name only or by full filepath) will
    % never be automatically closed.
    whitelistedFiles = {};
    
end

%% Constructor
methods (Access = private)
    
    function obj = EditorManager()
        % Constructor for EditorManager
        %
        %obj = EditorManager()
        %
        % EditorManager uses a singleton pattern, meaning we'll only allow one instance of it to exist at a
        % time. After all, there's only one MATLAB editor.
        %
        % To accomplish this, we make this constructor private, and instead supply a public .getSingleton() function to
        % retrieve the singleton. In order to retreive an instance of this class, you must use the .getSingleton method.
        %
        % Outputs:
        %   obj: The EditorManager object
        %
        
        % We don't really need to do anything here, but we must define it
    end
    
end

methods (Static)
   
    function obj = getSingleton()
        % Function to retrieve the EditorManager
        %
        %obj = EditorManager.getSingleton()
        %
        % This function returns the singleton EditorManager, constructing the singleton if it doens't already exist.
        %
        % Outputs:
        %   obj: The singleton EditorManager
        %
        
        % We store the singleton as a persistent variable; it'll stick around for the entire MATLAB session unless
        % `clear functions` is called.
        persistent singleton;
        if isempty(singleton)
            singleton = MatLib.dev.EditorManager();
        end
        obj = singleton;
    end
    
end

%% Property Validators
% Since this is a class instead of a struct, it would be nice to take advantage of an easy opportunity to make sure
% properties match the expected types. Property validators are wonderful for this.
methods
    
    function set.whitelistedFiles(obj, value)
        if ~isempty(value) && ~iscellstr(value)
            error('Value must be either empty or a cellstr');
        end
        obj.whitelistedFiles = value;
    end 
    
end

end
