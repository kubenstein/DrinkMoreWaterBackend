require 'json'
require 'sinatra'
require 'sinatra/namespace'
require './config/environment_specific_config'
require './app/app'
autoload :Sequel, './config/db'
require_all './app/libs/*'
require_all './app/models/*'
require_all './app/workflows/*'


set :app_root, APP_ROOT
set :root, File.join(APP_ROOT, 'app')