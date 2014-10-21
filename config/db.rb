require 'yaml'
require 'erb'
require 'logger'

db_params = YAML.load(
    ERB.new(File.read("#{settings.app_root}/config/database.yml")).result
)[settings.environment.to_s]


##### URI TO DB #####
db_uri = ''
db_uri += "#{db_params['adapter'].gsub('postgresql', 'postgres')}://"
db_uri += "#{db_params['username']}"
db_uri += ":"     if db_params['username'] && db_params['password']
db_uri += "#{db_params['password']}"
db_uri += "@"     if db_params['username']
db_uri += "#{db_params['host']}"
db_uri += ":#{db_params['port']}"     if db_params['port']
db_uri += "/"     if db_params['host']
db_uri += "#{db_params['database']}"
#####################


DB = Sequel.connect(db_uri, logger: Logger.new(STDOUT))