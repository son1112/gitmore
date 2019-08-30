require_relative '../lib/branch_matcher.rb'

RSpec.describe BranchMatcher do
  let(:subject) { described_class.new(repository, matcher, option)}
  let(:repository) { 'directory-name' }
  let(:matcher) { 'branch-name' }
  let(:option) { nil }

  describe '#initialize' do
    context 'with no option' do
      it 'has a repository'
      it 'has a matcher'
      it 'has no option'
      it 'has an empty result'
    end
    context 'with an option' do
      let(:option) { 'find' }

      it 'has a repository'
      it 'has a matcher'
      it 'has an option'
      it 'has an empty result'
    end
  end

  describe '#display' do
    context 'with option `f` or `find`' do
      context 'when the branch exists'
      context 'when the branch does not exist'
    end
    context 'with option `s` or `similar`' do
      context 'when similar branch exists'
      context 'when similar branch does not exist'
    end
    context 'with no option or any other option' do
      context 'when the current branch matches the matcher'
      context 'when the current branch does not match the matcher'
    end
  end

  describe '#checkout' do
    context 'when the matcher branch exists' do
      context 'with a clean status' do
        context 'with a matcher that matches the current branch'
        context 'with a matcher that does not match the current branch'
      end
      context 'with unstaged changes' do
      end
    end
  end
end
