# lib = File.expand_path("lib", __dir__)
# gem fury build runs ruby 1.9 wat?, which doesn't support __dir__
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gitmore/version"

Gem::Specification.new do |spec|
  spec.name = "gitmore"
  spec.version = Gitmore::VERSION
  spec.authors = ["son1112"]
  spec.email = ["anderson.reinkordt@gmail.com"]

  spec.summary = %q{Special Git helper tools}
  spec.description = %q{When you need to git things done on multiple local repositories.}
  spec.homepage = "https://github.com/son1112/gitmore"
  spec.license = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata["allowed_push_host"] = 'https://rubygems.org'
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "byebug"

  spec.add_runtime_dependency "colorize"
end
