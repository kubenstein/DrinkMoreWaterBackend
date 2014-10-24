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
      result = workflow.call(params['donation'])

      status result ? 200 : 422
      erb :create, locals: {success: result, donation: workflow.model}
    end

  end
end

not_found do
  status 404
  erb :page_404
end


def use_workflow(workflow)
  workflow.new
end