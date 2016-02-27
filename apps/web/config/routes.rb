post '/donations', to: 'donations#create'
# Configure your routes here
# See: http://www.rubydoc.info/gems/hanami-router/#Usage
namespace '/v1' do
  get '/donations', to: 'donations#index'
  post '/donations', to: 'donations#create'
end