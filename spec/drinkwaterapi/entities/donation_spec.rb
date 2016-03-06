require 'spec_helper'

describe Donation do
  let(:donation) { Donation.new(name: 'Mr Johns') }

  it 'can be initialised with attributes' do
    expect(donation.name).to eq 'Mr Johns'
  end

  it 'fill fake by default' do
    expect(donation.fake).to eq false
  end
end
