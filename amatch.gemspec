# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'amatch/version'

Gem::Specification.new do |spec|
  spec.name           = 'amatch'
  spec.version        = Amatch::VERSION
  spec.authors        = ['Florian Frank', 'Ciocanel Razvan']
  spec.email          = 'flori@ping.de'

  spec.summary        = %q{Approximate String Matching library}
  spec.description    = %q{Amatch is a library for approximate string matching and searching in strings. Several algorithms can be used to do this, and it's also possible to compute a similarity metric number between 0.0 and 1.0 for two given strings.}
  spec.homepage       = 'http://github.com/Chocksy/amatch'
  spec.licenses       = ['Apache-2.0']

  spec.files          = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(tests)/}) }
  spec.require_paths  = %w[lib ext]
  spec.test_files     = `git ls-files -- tests/*`.split("\n")
  spec.executables    = %w[agrep dupfind]
  spec.extensions     = %w[ext/extconf.rb]

  spec.required_ruby_version = '>= 2.2.5'

  spec.add_runtime_dependency 'tins', '~> 1.0'
  spec.add_runtime_dependency 'mize', '>= 0'

  # SPECS
  spec.add_development_dependency 'test-unit', '~> 3.0'
  spec.add_runtime_dependency 'rake', '>= 0'
end
