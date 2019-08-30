module Gitt
  module Statustician
    def status
      repositories.each do |repository|
        Dir.chdir(repository) do
          unless `git status --porcelain -uno`.to_s.empty?
            puts repository.colorize(:black).on_green
            system('git status')
          end
        end
      end
    end
  end
end
