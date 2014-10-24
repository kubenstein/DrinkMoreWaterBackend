require_relative '../spec_helper'

describe CreateDonationWorkflow do

  let(:good_params) { {'name' => 'new_name'} }
  let(:bad_params) { {'name' => 'new_name', 'extra_param' => 'DONT_PASS_ME_TO_MODEL'} }
  let(:donation) { OpenStruct.new(save: true, members: good_params.keys.map(&:to_sym)) }

  it 'saves model with given params' do
    expect(Donation).to receive(:new).with(good_params).and_return(donation)
    expect(donation).to receive(:save)
    subject.call(good_params)
  end

  it 'returns model' do
    expect(Donation).to receive(:new).and_return(donation)
    subject.call(good_params)
    expect(subject.model).to eq donation
  end

  it 'sanitize params for model' do
    expect(Donation).to receive(:new).with(good_params).and_return(donation)
    subject.call(bad_params)
  end

end