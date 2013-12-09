#!/usr/bin/env rake
require "bundler/gem_tasks"

$:.unshift File.dirname(__FILE__) + 'lib'

$:.unshift './lib', './spec'


require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new

task :default => :spec

desc "Ejecutar espectativas"

task :spec_local do
  sh "rspec -I. spec/matriz_spec.rb"

end


desc "Ejecutar con documentacion"
task :doc do

  sh "rspec -I. spec/matriz_spec.rb --format documentation"
end


desc "Ejecutar programa"
task :bin do
  sh "ruby bin/main.rb"

end

desc "Ejecutar las espectativas version html"

task :thtml do
  sh "rspec -I. spec/matriz_spec.rb --format html"
  

end
