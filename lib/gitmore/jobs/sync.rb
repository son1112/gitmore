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
      `git fetch && git pull`
    end
  end
end
