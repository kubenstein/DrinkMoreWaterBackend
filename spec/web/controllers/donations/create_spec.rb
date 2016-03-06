require 'spec_helper'

describe Web::Controllers::Donations::Create do
  let(:action) { subject }

  before do
    DonationRepository.clear
  end

  it 'creates donation' do
    response = action.call({donation: {name: 'donation_name'}})

    expect(response[0]).to eq 200
    expect(action.exposures[:format]).to eq :json
    expect(action.exposures[:donation].name).to eq 'donation_name'
    expect(action.exposures[:donation].id).to be_kind_of Fixnum
  end

  it 'doesnt create invalid donation' do
    response = action.call({donation: {name: ''}})

    expect(response[0]).to eq 422
    expect(action.exposures[:format]).to eq :json
    expect(action.exposures[:donation].id).to be_kind_of NilClass
  end
end
