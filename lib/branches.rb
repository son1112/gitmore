module Gitt
  module Branches
    def branches
      matching_repositories = []

      repositories.each do |repository|
        Dir.chdir(repository) do
          case option
          when 'f', 'find'
            format_branch_info(repository, find)
          when 's', 'similar'
            format_branch_info(repository, find_similar)
          else
            # Default: prints repository branch info if currently on this branch
            if current_branch == matcher
              matching_repositories << repository
              format_branch_info(repository, `git branch --color`)
            end
          end
        end
      end

      if matcher == 'master' && matching_repositories.count < count
        non_matching_repositories = repositories - matching_repositories
        non_matching_count = non_matching_repositories.count
        puts "NOTICE: #{non_matching_count} branches checked out to something other than master!".colorize(:black).on_red

        non_matching_repositories.each do  |name|
          puts name.colorize(:red)
        end
      end
    end

    def checkout
      repositories.each do |repository|
        Dir.chdir(repository) do
          if branch_exists? && clean_status?
            unless current_branch == matcher
              `git checkout #{matcher}`
            end
          elsif !branch_exists?
            puts "branch #{matcher} does not exit on #{repository}"
          elsif !clean_status?
            puts repository.colorize(:black).on_red
            system('git status')
          end
        end
      end
    end

    def fetches
      repositories.each do |repository|
        # TODO: refactor usage of Dir into block yield helper of some sort
        puts "Checking for changes in #{repository}...".colorize(:black).on_blue.blink
        Dir.chdir(repository) do
          unless `git fetch`.to_s.empty?
            puts repository.colorize(:black).on_yellow
            puts fetch
          end
        end
      end
    end
  end
end
