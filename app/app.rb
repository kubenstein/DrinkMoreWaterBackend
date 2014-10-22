namespace '/v1' do
  namespace '/donations' do

    get '/?' do
      @donations = use_workflow(DonationListingWorkflow).call
      erb :index
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
  workflow.new
end