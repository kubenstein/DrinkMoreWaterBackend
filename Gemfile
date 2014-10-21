source 'https://rubygems.org'

ruby '2.1.0'

gem 'sinatra'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'thin'

group :test do
  gem 'rspec'
  gem 'rack-test'
end

group :test, :development do
  gem 'sqlite3'
end

group :development do
  gem 'sinatra-reloader'
end

group :production do
  gem 'pg'
end