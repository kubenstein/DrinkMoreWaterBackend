namespace '/v1' do
  namespace '/donations' do

    get '/?' do
      donations = use_workflow(DonationListingWorkflow).call
      erb :index, locals: {donations: donations}
    end

    get '/new' do
      erb :new
    end

    post '/?' do
      workflow = use_workflow(CreateDonationWorkflow)
      result = workflow.call(params)
      erb :create, locals: {success: result, donation: workflow.model}
    end

  end
end


def use_workflow(workflow)
  workflow.new
end