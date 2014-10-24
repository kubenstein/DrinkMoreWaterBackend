require_relative '../spec_helper'

describe CreateDonationWorkflow do

  let(:good_params) { {'name' => 'new_name'} }
  let(:good_params_values) { good_params.values }
  let(:bad_params) { {'name' => 'new_name', 'extra_param' => 'DONT_PASS_ME_TO_MODEL'} }
  let(:donation) { instance_double(Donation, name: 'new_donation').as_null_object }
  let(:invalid_dotation) { instance_double(Donation, name: '').as_null_object }

  it 'saves model with given params' do
    expect(Donation).to receive(:new).with(*good_params_values).and_return(donation)
    expect(donation).to receive(:create)
    subject.call(good_params)
  end

  it 'doesnt save model without name' do
    allow(Donation).to receive(:new).and_return(invalid_dotation)
    expect(donation).not_to receive(:create)
    subject.call({dummy: :dummy})
  end

  it 'returns model' do
    expect(Donation).to receive(:new).and_return(donation)
    subject.call(good_params)
    expect(subject.model).to eq donation
  end

  it 'sanitize params for model' do
    expect(Donation).to receive(:new).with(*good_params_values).and_return(donation)
    subject.call(bad_params)
  end

end