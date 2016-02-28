require 'spec_helper'

describe Donation do
  it 'can be initialised with attributes' do
    donation = Donation.new(name: 'Mr Johns')
    donation.name.must_equal 'Mr Johns'
  end

  it 'fill fake by default' do
    donation = Donation.new
    donation.fake.must_equal false
  end
end
