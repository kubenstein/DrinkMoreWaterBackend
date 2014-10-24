require_relative '../spec_helper'

describe Donation do

  subject { Donation }

  it 'should store business fields' do
    donation = subject.new(name: 'name', created_at: 'created_at')

    expect(donation.name).to eq 'name'
    expect(donation.created_at).to eq 'created_at'
  end

end