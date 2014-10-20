#
# app loading sequence:
#
#   X
#   |
#   * - config.ru - rackup entry point, load whole app and run it after
#   |
#   * config/environment.rb - set APP_ROOT
#   |						            - load sinatra
#   |
#   * config/application - set application specific variables
#   |					           - set environment specific configs
#   |
#   * config/db - set db related things, in this app it load activerecord,
#   |			        based on config/database.yml file
#   |
#   * app/models/* - load models classes
#   |
#   * app/app.rb - load app path definitions
#   |
#   O serve request
#
require './config/environment'
run Sinatra::Application
