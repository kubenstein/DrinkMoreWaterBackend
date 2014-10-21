require_relative '../spec_helper'

describe 'api v1' do

  it 'lists all the donations' do
    allow_any_instance_of(Object).to receive(:use_workflow).and_return([
                                                                           {name: 'name1', timestamp: 1412897146},
                                                                           {name: 'name2', timestamp: 1413897146},
                                                                       ])
    get '/v1/donations'

    expect(last_response.status).to eq 200
    json = JSON.parse(last_response.body)

    root_node = json['donations']
    expect(root_node).not_to be_empty
    expect(root_node).to have(2).items
    expect(root_node[0]).to eq({'name' => 'name1',
                                'timestamp' => 1412897146})
    expect(root_node[1]).to eq({'name' => 'name2',
                                'timestamp' => 1413897146})
  end
end