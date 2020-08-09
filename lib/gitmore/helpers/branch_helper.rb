# typed: false
require 'colorize'

module Gitmore
  module BranchHelper
    def branch_exists?
      # TODO: update to work if branch not checked out previously

      `git checkout -q #{matcher}`
      !`git rev-parse --verify --quiet #{matcher}`.to_s.empty?
    end

    def format_branch_info(repository, result, color=:on_green)
      return unless result
      puts repository.colorize(:black).send(color)
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
