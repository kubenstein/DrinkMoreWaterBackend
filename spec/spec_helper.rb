ENV['RACK_ENV'] = 'test'

require './config/environment'

RSpec.configure do |config|
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end