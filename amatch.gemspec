# frozen_string_literal: true
# coding: utf-8
# stub: amatch 0.4.0 ruby lib ext
# stub: ext/extconf.rb


lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'amatch/version'

Gem::Specification.new do |spec|
  spec.name     = 'amatch'
  spec.version  = '0.4.0'
  spec.authors  = ['Florian Frank', 'Ciocanel Razvan']
  spec.email    = 'chocksy@gmail.com'
  spec.date     = "2019-08-06"

  spec.summary        = %q{Approximate String Matching library}
  spec.description    = %q{Amatch is a library for approximate string matching and searching in strings. Several algorithms can be used to do this, and it's also possible to compute a similarity metric number between 0.0 and 1.0 for two given strings.}
  spec.homepage       = "https://hubstaff.com/"
  spec.license        = "Nonstandard"

  spec.files          = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(spec)/}) }
  spec.require_paths  = %w[lib ext]
  spec.test_files     = `git ls-files -- tests/*`.split("\n")
  spec.executables    = %w[agrep dupfind]
  spec.extensions     = ['ext/extconf.rb']

  spec.extra_rdoc_files = %w[README.md lib/amatch.rb lib/amatch/map.rb lib/amatch/version.rb ext/amatch_ext.c ext/pair.c]
  spec.rdoc_options = ['--title', 'Amatch - Approximate Matching', '--main', 'README.md']

  spec.required_rubygems_version = Gem::Requirement.new('>= 0') if spec.respond_to? :required_rubygems_version=
  spec.rubygems_version = '2.7.7'

  spec.add_runtime_dependency       'tins', '~> 1.0'
  spec.add_runtime_dependency       'mize', '>= 0'

  spec.add_development_dependency   'gem_hadar', '~> 1.9.1'
  spec.add_development_dependency   'test-unit', '~> 3.0'
end
