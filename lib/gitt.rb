require 'gitt/version'

require 'helpers/branch_helper.rb'
require 'helpers/ruby_helper.rb'
require 'branch_matcher.rb'
require 'statustician.rb'

module Gitt
  class Error < StandardError; end
  def self.branches(branch_string, option=nil)
    repositories = Gitt::BranchMatcher.new(branch_string, option)
    repositories.branches
  end

  def self.checkouts(branch_string=nil)
    repositories = Gitt::BranchMatcher.new(branch_string)
    repositories.checkout
  end

  def self.statuses(branch_string=nil)
    repositories = Gitt::BranchMatcher.new(branch_string)
    repositories.status
  end

  def self.diffs(branch_string=nil)
    repositories = Gitt::BranchMatcher.new(branch_string)
    repositories.diffs
  end

  def self.gems(branch_string=nil)
    repositories = Gitt::BranchMatcher.new(branch_string)
    repositories.gems
  end

  def self.versions( language)
    repositories = Gitt::BranchMatcher.new
    repositories.versions(language)
  end

  def self.fetches
    repositories = Gitt::BranchMatcher.new
    repositories.fetches
  end

  def self.pulls
    repositories = Gitt::BranchMatcher.new
    repositories.pulls
  end
end
