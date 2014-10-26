require_relative '../spec_helper'

describe Donation do
  subject { Donation }

  it 'should store business fields' do
    donation = subject.new(name: 'name', created_at: 'created_at')

    expect(donation.name).to eq 'name'
    expect(donation.created_at).to eq 'created_at'
  end

  it 'fill created_at by default' do
    donation = subject.new
    expect(donation.created_at).not_to be_nil
  end

end