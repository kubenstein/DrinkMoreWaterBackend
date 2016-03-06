require 'spec_helper'

describe DonationRepository do
  let(:fake_donation) { DonationRepository.create(Donation.new(name: 'fake', fake: true)) }
  let(:donation) { DonationRepository.create(Donation.new(name: 'not_fake', fake: false)) }

  it 'returns all not fake donations' do
    DonationRepository.clear
    fake_donation
    donation

    result = DonationRepository.all_not_fake
    expect(result.count).to eq 1
    expect(result.first).to eq donation
  end
end
