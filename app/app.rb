namespace '/v1' do
  namespace '/donations' do

    get '/?' do
      @models = use_workflow(Donation.all)
      {donations: @models.map(&:to_hash)}.to_json
    end

    get '/new' do
      erb :new
    end

    post '/?' do
      @model = Donation.new(params[:model])
      if @model.save
        redirect '/v1/donations'
      end
    end

  end
end


def use_workflow(workflow)
  workflow
end