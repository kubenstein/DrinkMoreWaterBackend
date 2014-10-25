require_relative '../spec_helper'
require_rel '../support/*'

describe 'api v1' do
  let(:date) { DateTime.new(2001) }
  let(:date_timestamp) { date.to_time.to_i }
  let(:later_date) { DateTime.new(2002) }
  let(:later_date_timestamp) { later_date.to_time.to_i }

  let(:donation) { instance_double(Donation, name: 'new_donation_name', created_at: date).as_null_object }
  let(:donation2) { instance_double(Donation, name: 'new_donation_name2', created_at: later_date).as_null_object }
  let(:invalid_donation) { instance_double(Donation, name: '', created_at: date).as_null_object }
  let(:fake_listing_workflow) { instance_double(DonationListingWorkflow, call: [donation, donation2]).as_null_object }
  let(:fake_create_workflow) { instance_double(CreateDonationWorkflow, model: donation).as_null_object }
  let(:fake_failing_create_workflow) { instance_double(CreateDonationWorkflow, model: invalid_donation, call: false).as_null_object }


  it 'lists all donations' do
    stub_workflow_with!(fake_listing_workflow)
    get '/v1/donations'

    expect(last_response.status).to eq 200
    json = JSON.parse(last_response.body)

    response_root_node = json['donations']
    expect(response_root_node).to have(2).items
    expect(response_root_node[0]).to eq({'name' => 'new_donation_name', 'timestamp' => date_timestamp})
    expect(response_root_node[1]).to eq({'name' => 'new_donation_name2', 'timestamp' => later_date_timestamp})
  end

  it 'uses proper workflow when listing all donations' do
    stub_erb!
    expect_workflow(DonationListingWorkflow).to receive(:call).with(no_args)
    get '/v1/donations'
  end


  it 'uses proper workflow when creating donation' do
    stub_erb!
    params = {'donation' => {'name' => 'name'}}
    expect_workflow(CreateDonationWorkflow).to receive(:call).with(params['donation'])
    post '/v1/donations', donation: {name: 'name'}
  end


  it 'returns proper json after donation create' do
    stub_workflow_with!(fake_create_workflow)
    post '/v1/donations'

    expect(last_response.status).to eq 200
    json = JSON.parse(last_response.body)

    expect(json['status']).to eq 'success'
    expect(json['donation']).to eq({'name' => 'new_donation_name', 'timestamp' => date_timestamp})
  end

  it 'returns proper json after donation create fail' do
    stub_workflow_with!(fake_failing_create_workflow)
    post '/v1/donations'

    expect(last_response.status).to eq 422
    json = JSON.parse(last_response.body)

    expect(json['status']).to eq 'error'
    expect(json['donation']).to eq({'name' => '', 'timestamp' => date_timestamp})
  end

end