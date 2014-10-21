require 'bundler'
ENV['RACK_ENV'] ||= 'development'
Bundler.require(:default, ENV['RACK_ENV'].to_sym)

APP_ROOT = File.expand_path(File.join(File.dirname(__FILE__), '..'))

require 'sinatra'
require './config/application'
