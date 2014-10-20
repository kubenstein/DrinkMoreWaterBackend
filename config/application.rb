set :app_root, APP_ROOT
set :root, File.join(APP_ROOT, 'app')

configure :development do |c|
  require 'sinatra/reloader'
  c.also_reload './config/*.rb'
  c.also_reload './models/*.rb'
end

require './config/db'
require './app/models/model'
require './app/app'