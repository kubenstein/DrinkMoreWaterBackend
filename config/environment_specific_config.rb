configure :development do |c|
  require 'sinatra/reloader'
  c.also_reload './config/*.rb'
  c.also_reload './models/*.rb'
end

configure :production do |c|
  Dynopoker.configure do |dynopoker_config|
    dynopoker_config.address = 'http://api.drinkwaterapp.info/'
  end
end