source 'http://rubygems.org'
source 'http://gemcutter.org'
gem 'rails', '3.0.3'
gem 'sinatra'
gem 'sinatra-xsendfile'
gem "mootools-rails"
gem 'delayed_job', '2.1.2'
gem 'devise' 
gem 'simple_uuid'

group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'rr'
  gem 'timecop'
  gem 'factory_girl_rails'
end

platforms :mri, :mingw do
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

platforms :jruby do
  gem 'activerecord-jdbcsqlite3-adapter'
  gem "jruby-openssl"
end


#gem 'rails_admin', :git => 'git://github.com/sferik/rails_admin.git'


# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
# group :development, :test do
#   gem 'webrat'
# end
