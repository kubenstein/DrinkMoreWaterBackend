require 'spec_helper'

describe Web::Controllers::Donations::Index do
  let(:action) { Web::Controllers::Donations::Index.new }

  before do
    DonationRepository.clear
    @donation1 = DonationRepository.create(Donation.new(name: 'donation2'))
    @donation2 = DonationRepository.create(Donation.new(name: 'donation2'))
  end

  it 'lists all donations' do
    response = action.call({})

    response[0].must_equal 200
    assert_equal action.exposures[:format], :json
    assert_equal action.exposures[:donations], [@donation1, @donation2]
  end
end
