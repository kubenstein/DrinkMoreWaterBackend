require 'json'
require 'sinatra'
require 'sinatra/namespace'
require './config/environment_specific_config'
require './app/app'
require_all './app/models/*'
require_all './app/workflows/*'
autoload :DB, './config/db'


set :app_root, APP_ROOT
set :root, File.join(APP_ROOT, 'app')