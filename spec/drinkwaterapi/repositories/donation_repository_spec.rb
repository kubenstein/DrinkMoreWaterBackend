require 'spec_helper'

describe DonationRepository do
  it 'returns all not fake donations' do
    DonationRepository.clear
    DonationRepository.create(Donation.new(name: 'fake', fake: true))
    not_fake_donation = DonationRepository.create(Donation.new(name: 'not_fake', fake: false))

    result = DonationRepository.all_not_fake
    result.count.must_equal 1
    result.first.must_equal not_fake_donation
  end
end
