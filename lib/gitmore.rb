require 'gitmore/version'
require 'gitmore/utils'

module Gitmore
  class Error < StandardError; end

  class Matcher
    attr_reader :branch_string, :option

    def initialize(branch_string=nil, option=nil)
      @working_dir = working_dir
      @branch_string = branch_string
      @option = option
    end

    def branches
      repositories.branches
    end

    def checkouts
      repositories.checkout
    end

    def statuses
      repositories.status
    end

    def diffs
      repositories.diffs
    end

    def gems
      repositories.gems
    end

    def versions(language)
      repositories.versions(language)
    end

    def fetches
      repositories.fetches
    end

    def pulls
      repositories.pulls
    end

    def sync
      repositories.sync(@working_dir)
    end

    private

    # TODO: handle naming conflict - this actually returns an instance of BranchMatcher
    def repositories
      # TODO: rename Gitmore::Utilities::RepositoryHelper.rb
      Gitmore::Repositories.get_for(branch_string, option)
    end

    def working_dir
      Dir.pwd
    end
  end
end
