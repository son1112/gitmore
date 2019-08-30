require 'colorize'

module Gitt
  module BranchHelper
    def branch_exists?
      !`git rev-parse --verify --quiet #{matcher}`.to_s.empty?
    end

    def format_branch_info(repository, result)
      return unless result
      puts repository.colorize(:black).on_green
      puts puts result
    end

    def clean_status?
      `git status --porcelain -uno`.to_s.empty?
    end

    def current_branch
      `git symbolic-ref HEAD | cut -d/ -f3-`.to_s.strip
    end

    def similar_branch_exists?
      !`git branch -a --list #{matcher}`.to_s.empty?
    end
  end
end
