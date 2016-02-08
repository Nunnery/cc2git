# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cc2git/version'

Gem::Specification.new do |gem|
  gem.name = 'cc2git'
  gem.version = Cc2git::VERSION

  gem.summary = 'A Ruby CLI for converting ClearCase to Git.'
  gem.licenses = ['MIT']
  gem.authors = ['Richard Harrah']
  gem.email = 'topplethenunnery@gmail.com'
  gem.homepage = 'https://nunnery.github.io/cc2git'

  glob = lambda { |patterns| gem.files & Dir[*patterns] }

  gem.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  gem.require_paths = ['lib']
  gem.bindir = 'exe'
  gem.executables = gem.files.grep(%r{^exe/}) { |f| File.basename(f) }
  gem.test_files = glob['{spec/{**/}*_spec.rb']
  gem.extra_rdoc_files = glob['*.{txt,rdoc}']

  gem.add_dependency 'commander', '~> 4.3' # CLI parser
  gem.add_dependency 'pastel', '~> 0.5' # Colored terminal output
  gem.add_dependency 'git', '~> 1.2' # Ruby/Git library

  gem.add_development_dependency 'bundler', '~> 1.10'
  gem.add_development_dependency 'coveralls', '~> 0.8'
  gem.add_development_dependency 'fuubar', '~> 2.0'
  gem.add_development_dependency 'pry', '~> 0.10'
  gem.add_development_dependency 'rake', '~> 10.0'
  gem.add_development_dependency 'rspec', '~> 3.3'
  gem.add_development_dependency 'yard', '~> 0.8'
end
