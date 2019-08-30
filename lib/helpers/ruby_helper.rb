module Gitt
  module RubyHelper
    def gems
      repositories.each do |repository|
        Dir.chdir(repository) do
          gem_files = Dir.entries(Dir.pwd).collect { |entry| entry[/.gemspec/] }
          if gem_files.compact.count > 0
            puts repository
          end
        end
      end
    end

    def versions(language)
      case language

      when 'ruby'
        repositories.each do |repository|
          Dir.chdir(repository) do
            puts repository.colorize(:black).on_green
            if File.exists?('.ruby-version')
              puts File.read('.ruby-version').strip
            else
              system('ruby -v')
            end
          end
        end

      else
        puts "Language #{language} not yet implemented."
      end

    end
  end
end
