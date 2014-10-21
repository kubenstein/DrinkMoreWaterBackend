require 'yaml'
require 'erb'
require 'sinatra/activerecord'

ActiveRecord::Base.logger = Logger.new(STDOUT)
ActiveRecord::Base.establish_connection(
    YAML.load(
        ERB.new(File.read("#{settings.app_root}/config/database.yml")).result
    )[settings.environment.to_s]
)

