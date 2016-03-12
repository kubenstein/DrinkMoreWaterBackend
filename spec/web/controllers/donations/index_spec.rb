require 'spec_helper'

describe Web::Controllers::Donations::Index do
  let(:action) { subject }

  before do
    DonationRepository.clear
    @donation1 = DonationRepository.create(Donation.new(name: 'donation2'))
    @donation2 = DonationRepository.create(Donation.new(name: 'donation2'))
  end

  it 'lists all donations' do
    response = action.call({})

    expect(response[0]).to eq 200
    expect(action.exposures[:format]).to eq :json
    expect(action.exposures[:donations].all).to eq [@donation2, @donation1]
  end
end
