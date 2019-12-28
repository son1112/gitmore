require_relative 'helpers/branch_helper.rb'
require_relative 'helpers/ruby_helper.rb'
require_relative 'repositories.rb'
require_relative 'branches.rb'
require_relative 'statustician.rb'

module Gitmore
  class BranchMatcher
    attr_accessor :matcher, :option, :repositories

    include BranchHelper
    include RubyHelper
    include Gitmore::Branches
    include Gitmore::Statustician

    def initialize(matcher=nil, option=nil)
      @matcher = matcher || 'master'
      @option = option
      @repositories = Gitmore::Repositories.get
    end

    private

    def count
      repositories.count
    end

    def find
      if branch_exists?
        `git branch --color`
      end
    end

    def find_similar
      if similar_branch_exists?
        `git branch -a --list *#{matcher}*`
      end
    end
  end
end
