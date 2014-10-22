source 'https://rubygems.org'

ruby '2.1.0'

gem 'sinatra'
gem 'sinatra-contrib'
gem 'sequel'
gem 'thin'
gem 'require_all'

group :test do
  gem 'rspec'
  gem 'rspec-collection_matchers'
  gem 'rack-test'
end

group :test, :development do
  gem 'sqlite3'
end

group :development do
end

group :production do
  gem 'pg'
end