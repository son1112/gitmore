require 'sidekiq'

# TODO: update
# Start up sidekiq via
# ./bin/sidekiq -r ./examples/por.rb
# and then you can open up an IRB session like so:
# irb -r ./examples/por.rb
# where you can then say
# PlainOldRuby.perform_async "like a dog", 3
#
class Gitmore::SyncJob
  include Sidekiq::Worker

  def perform(dir)
    # chdir git fetch and pull
    Dir.chdir(dir) do
      # TEST
      count = Dir.entries(dir).count
      count.times do
        `afplay /System/Library/Sounds/Tink.aiff`
      end
    end
  end
end
