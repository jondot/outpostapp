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
  gem 'compass'
  gem 'compass-susy-plugin'
end

platforms :mri, :mingw do
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

platforms :jruby do
  gem 'warbler'
  gem 'activerecord-jdbcsqlite3-adapter'
  gem "jruby-openssl"
end


