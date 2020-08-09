module Gitmore
  module Repositories
    # TODO: add utilities for info gathering
    def self.get_for(branch_string, option)
      Gitmore::BranchMatcher.new(branch_string, option)
    end

    def self.get
      directories.select do |dir|
        Dir.entries(dir).include?('.git')
      end
    end

    def self.directories
      directories = Dir.entries(Dir.pwd)
        .select do |entry|
          File.directory? entry
        end

      directories.shift(2)
      directories
    end
  end
end
