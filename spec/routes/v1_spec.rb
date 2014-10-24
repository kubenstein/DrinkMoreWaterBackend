require_relative '../spec_helper'
require_rel '../support/*'

describe 'api v1' do

  let(:fake_listing_workflow) do
    OpenStruct.new(call: [
        OpenStruct.new(name: 'name1', created_at: 1412897146, forbitten_field: 'DONT_SHOW_ME'),
        OpenStruct.new(name: 'name2', created_at: 1413897146, id: 1)
    ])
  end

  let(:fake_creating_workflow) do
    fw = OpenStruct.new(model: OpenStruct.new(name: 'new_name', created_at: 1413897146, id: 1))
    def fw.call(*args) ; true end
    fw
  end


  it 'lists all donations' do
    stub_workflow_with!(fake_listing_workflow)
    get '/v1/donations'

    expect(last_response.status).to eq 200
    json = JSON.parse(last_response.body)

    root_node = json['donations']
    expect(root_node).to have(2).items
    expect(root_node[0]).to eq({'name' => 'name1', 'timestamp' => 1412897146})
    expect(root_node[1]).to eq({'name' => 'name2', 'timestamp' => 1413897146})
  end

  it 'uses proper workflow when listing all donations' do
    stub_erb!
    expect_workflow(DonationListingWorkflow).to receive(:call).with(no_args).and_return(fake_listing_workflow.call)
    get '/v1/donations'
  end


  it 'uses proper workflow when creating donation' do
    stub_erb!
    params = {'donation' => {'name' => 'name'}}
    expect_workflow(CreateDonationWorkflow).to receive(:call).with(params['donation']).and_return(fake_creating_workflow.call(params['donation']))
    post '/v1/donations', donation: {name: 'name'}
  end


  it 'returns proper json after donation create' do
    stub_workflow_with!(fake_creating_workflow)
    post '/v1/donations'

    expect(last_response.status).to eq 200
    json = JSON.parse(last_response.body)
    status = json['status']
    donation = json['donation']

    expect(status).to eq 'success'
    expect(donation).to eq({'name' => 'new_name', 'timestamp' => 1413897146})
  end

end