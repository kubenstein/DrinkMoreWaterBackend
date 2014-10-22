require 'bundler'

ENV['RACK_ENV'] ||= 'development'

APP_ROOT = Bundler.root
APP_ENV = ENV['RACK_ENV']

Bundler.require(:default, ENV['RACK_ENV'])
require './config/application'
