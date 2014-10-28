require_relative '../spec_helper'

describe DonationListingWorkflow do

  it 'asks model for list of all donations ordered by id desc' do
    expect(Donation).to receive(:reverse_order).with(:id)
    subject.call
  end

end