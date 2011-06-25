# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.
require 'fileutils'
require File.expand_path('../config/application', __FILE__)
require 'rake'

OutpostApp::Application.load_tasks


desc 'create a war for jruby deployment'
task :war do 
  puts 'preparing..'
  FileUtils.rm 'Gemfile.lock'
  puts 'bundling..'
  `jruby -S bundle install`
  puts 'warbling..'
  `jruby -S warble`
  puts 'done!'
  puts 'note: when sqlite, dont forget to copy a migrated db/production.sqlite to your tomcat WEB-INF deployed folder.'
end
