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
      checkout = Proc.new { |repository| 
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
      }

      perform(&checkout)
    end

    def fetches
      fetch = Proc.new { |repository|
        puts "Fetching changes in #{repository}...".colorize(:black).on_blue.blink
        unless `git fetch`.to_s.empty?
          puts repository.colorize(:black).on_yellow
        end
      }

      perform(&fetch)
    end

    def pulls
      pull = Proc.new { |repository|
        puts "Pulling changes in #{repository}...".colorize(:black).on_blue.blink
        system('git pull')
      }

      perform(&pull)
    end

    private

    def perform(&block)
      repositories.each do |repository|
        Dir.chdir(repository) do
          block[repository]
        end
      end
    end
  end
end
