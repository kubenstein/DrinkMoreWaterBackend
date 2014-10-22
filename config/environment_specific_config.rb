configure :development do |c|
  require 'sinatra/reloader'
  c.also_reload './config/*.rb'
  c.also_reload './models/*.rb'
end