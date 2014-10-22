require 'json'
require 'sinatra'
require 'sinatra/namespace'
require './config/db'
require './app/models/donation'
require './config/environment_specific_config'
require './app/app'

set :app_root, APP_ROOT
set :root, File.join(APP_ROOT, 'app')