module Gitt
  module Repositories
    def self.get
      directories.select { |dir| Dir.entries(dir).include?('.git') }
    end

    def self.directories
      directories = Dir.entries(Dir.pwd).select { |entry| File.directory? entry }
      directories.shift(2)
      directories
    end
  end
end
