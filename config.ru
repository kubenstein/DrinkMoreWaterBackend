require 'newrelic_rpm'
require 'newrelic-hanami'
require './config/environment'

NewRelic::Agent.manual_start

run Hanami::Container.new
