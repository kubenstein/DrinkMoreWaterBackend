require_relative '../spec_helper'

describe 'app' do

  it 'returns proper json after donation create fail' do
    post '/NOT_FOUND_PATH'

    expect(last_response.status).to eq 404
    json = JSON.parse(last_response.body)
    expect(json['status']).to eq 404
  end

end