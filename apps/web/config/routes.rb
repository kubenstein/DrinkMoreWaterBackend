namespace '/v1' do
  get '/donations', to: 'donations#index'
  post '/donations', to: 'donations#create'
end