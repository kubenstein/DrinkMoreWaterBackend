require 'spec_helper'

describe Web::Controllers::Donations::Create do
  let(:action) { Web::Controllers::Donations::Create.new }
  before do
    DonationRepository.clear
  end

  it 'creates donation' do
    response = action.call({donation: {name: 'donation_name'}})

    response[0].must_equal 200
    assert_equal action.exposures[:format], :json
    assert_equal action.exposures[:donation].name, 'donation_name'
    assert_kind_of Fixnum, action.exposures[:donation].id
  end

  it 'doesnt create invalid donation' do
    response = action.call({donation: {name: ''}})

    response[0].must_equal 200
    assert_equal action.exposures[:format], :json
    assert_kind_of NilClass, action.exposures[:donation].id
  end
end
