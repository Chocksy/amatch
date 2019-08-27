require 'bundler'
require 'rubygems'
require 'rake'
require 'rake/clean'
require 'rake/testtask'
Bundler::GemHelper.install_tasks

Rake::TestTask.new do |test|
  test.pattern = 'tests/*.rb'
  test.verbose = true
end

def compile_task
  extensions = FileList['ext/**/extconf.rb']
  make = %w[gmake make].find { |c| system(c, '-v') }

  for file in extensions
    dir = File.dirname(file)
    CLEAN.include(File.join(dir, 'Makefile'), File.join(dir, '*.{bundle,o,so}'))
  end

  desc "Compile extensions: #{extensions * ', '}"
  task :compile do
    for file in extensions
      dir, file = File.split(file)
      cd dir do
        ruby file
        sh make
      end
    end
  end
end
compile_task

desc 'Default: run specs.'
task :default => :test
