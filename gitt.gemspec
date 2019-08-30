lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "gitt/version"

Gem::Specification.new do |spec|
  spec.name = "gitt"
  spec.version = Gitt::VERSION
  spec.authors = ["son1112"]
  spec.email = ["anderson.reinkordt@gmail.com"]

  spec.summary = %q{Special Git helper tools}
  spec.description = %q{When you need to git things done on multiple local repositories.}
  spec.homepage = "no page just yet"
  spec.license = "MIT"

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
