require 'yaml'
require 'sinatra/activerecord'

ActiveRecord::Base.establish_connection(
    YAML.load_file("#{settings.app_root}/config/database.yml")[settings.environment.to_s]
)

