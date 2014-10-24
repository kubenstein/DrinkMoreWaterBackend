require_relative '../spec_helper'

describe CreateDonationWorkflow do

  let(:good_params) { {'name' => 'new_name'} }
  let(:bad_params) { {'name' => 'new_name', 'extra_param' => 'DONT_PASS_ME_TO_MODEL'} }
  let(:donation) { instance_double(Donation, name: 'new_donation').as_null_object }

  xit 'saves model with given params' do
    expect(Donation).to receive(:new).with(good_params).and_return(donation)
    expect(donation).to receive(:save)
    subject.call(good_params)
  end

  xit 'returns model' do
    expect(Donation).to receive(:new).and_return(donation)
    subject.call(good_params)
    expect(subject.model).to eq donation
  end

  xit 'sanitize params for model' do
    expect(Donation).to receive(:new).with(good_params).and_return(donation)
    subject.call(bad_params)
  end

end