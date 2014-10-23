require_relative '../spec_helper'

describe Donation do

  it 'should store business fields' do
    subject.name = 'name'
    subject.created_at = 'created_at'

    expect(subject.name).to eq 'name'
    expect(subject.created_at).to eq 'created_at'
  end

end