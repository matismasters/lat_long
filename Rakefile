require 'bundler/gem_tasks'
require 'rake/testtask'
require 'rubocop/rake_task'
require 'reek/rake/task'

Rake::TestTask.new(:test) do |t|
  t.libs << "test"
  t.libs << "lib"
  t.test_files = FileList['test/**/*_test.rb']
end

RuboCop::RakeTask.new :rubocop do |t|
  t.options = ['--display-cop-names']
end

Reek::Rake::Task.new do |t|
  t.fail_on_error = true
end

task :default => [:test, :rubocop, :reek]
