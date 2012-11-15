# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'termnote/version'

Gem::Specification.new do |gem|
  gem.name          = "termnote"
  gem.version       = TermNote::VERSION
  gem.authors       = ["Kurtis Rainbolt-Greene"]
  gem.email         = ["me@kurtisrainboltgreene.name"]
  gem.summary       = %q{A terminal based keynote presentation machine}
  gem.description   = gem.summary
  gem.homepage      = "http://krainboltgreene.github.com/termnote"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'smart_colored', '~> 1.1'
  gem.add_runtime_dependency 'pygments.rb', '~> 0.3'
  gem.add_development_dependency 'yard'
  gem.add_development_dependency 'kramdown'
  # gem.add_runtime_dependency 'gemname', '~> 1.0'
  # gem.add_development_dependency 'gemname', '~> 1.0'
end
