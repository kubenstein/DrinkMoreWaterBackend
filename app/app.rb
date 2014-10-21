
get '/' do
	erb :index
end

post '/submit' do
	@model = Donation.new(params[:model])
	if @model.save
		redirect '/models'
	else
		"Sorry, there was an error!"
	end
end

get '/models' do
	@models = Donation.all
	erb :models
end