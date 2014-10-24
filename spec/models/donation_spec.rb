require_relative '../spec_helper'
require_rel '../support/*'

describe Donation do
  subject { Donation }

  it 'should store business fields' do
    donation = subject.new(name: 'name', created_at: 'created_at')

    expect(donation.name).to eq 'name'
    expect(donation.created_at).to eq 'created_at'
  end

  it 'fill created_at after create' do
    stub_db!
    donation = subject.new
    donation.create
    expect(donation.created_at).not_to be_nil
  end

end