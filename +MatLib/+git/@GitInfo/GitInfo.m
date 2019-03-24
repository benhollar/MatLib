classdef GitInfo < handle
% Class to store information about a Git repository
%
% This class is designed to fetch and store information about a Git repository from a local checkout. Fetching all of
% these pieces of information can be a real hassle with Git (as compared to SVN, which had 'svn info' to do it for you).
%

% **********************************************************************************************************************
% Author: Ben Hollar
% Copyright 2019
% **********************************************************************************************************************


%% Read-only properties
% These properties can be retrieved by the world at large, but may only be modified by class members.
properties (SetAccess = protected)
    
    % The remote URL for the repository
    repoUrl;
    
    % The name of the currently used local branch
    currentBranch;
    
    % All the names of the remote branches
    remoteBranches;
    
    % All the names of the local branches
    localBranches;
    
    % The most recent hash of the current branch
    currentHash;
    
    % The most recent commit's author
    lastModifiedAuthor;
    
    % The most recent commit date of the current branch
    %
    % For readability, this value is stored as a string in the format specified by the .datestrFormat property.
    lastModifiedDate;
    
end

% I'll also mark these properties Hidden, simply because they're not really relevant to the information this class is
% meant to retrieve and show. They'll still be readable in case anyone cares.
properties (SetAccess = protected, Hidden)
    
    % The format to use when converting dates to a string.
    datestrFormat = 'yyyy-mm-dd HH:MM:SS';
    
end

%% Constructor
methods
    
    function obj = GitInfo(varargin)
        % A convenience constructor for the GitInfo class
        %
        %obj = GitInfo()
        %obj = GitInfo(reopPath)
        %
        % Inputs:
        %   repoPath: (Optional) The path to a repository to query the info of. If not specified, an empty object is
        %       returned
        %
        
        repoPath = MatLib.util.parseInputs(varargin, []);
        if ~isempty(repoPath)
            obj = MatLib.git.GitInfo.query(repoPath);
        end
        
    end
    
end

%% Static Methods
% These methods do not require an instance of the class.
methods (Static)
   
    % Perform a query for information, returning a GitInfo object containing the retrieved info
    obj = query(repoPath);
    
end

%% Property Validators
% Since this is a class instead of a struct, it would be nice to take advantage of an easy opportunity to make sure
% properties match the expected types. Property validators are wonderful for this.
methods
   
    function set.repoUrl(obj, value)
        obj.repoUrl = MatLib.util.validateProperty(value, {'char'}, {'vector'});
    end
    
    function set.currentBranch(obj, value)
        obj.currentBranch = MatLib.util.validateProperty(value, {'char'}, {'vector'});
    end
    
    function set.remoteBranches(obj, value)
        if ~isempty(value) && ~iscellstr(value)
            error('Value must be either empty or a cellstr');
        end
        obj.remoteBranches = value;
    end
    
    function set.localBranches(obj, value)
        if ~isempty(value) && ~iscellstr(value)
            error('Value must be either empty or a cellstr');
        end
        obj.localBranches = value;
    end
    
    function set.currentHash(obj, value)
        obj.currentHash = MatLib.util.validateProperty(value, {'char'}, {'vector'});
    end
    
    function set.lastModifiedAuthor(obj, value)
        obj.lastModifiedAuthor = MatLib.util.validateProperty(value, {'char'}, {'vector'});
    end
    
    function set.lastModifiedDate(obj, value)
        obj.lastModifiedDate = MatLib.util.validateProperty(value, {'char'}, {'vector'});
    end
    
    function set.datestrFormat(obj, value)
        obj.datestrFormat = MatLib.util.validateProperty(value, {'char'}, {'vector'});
    end
    
end

end
