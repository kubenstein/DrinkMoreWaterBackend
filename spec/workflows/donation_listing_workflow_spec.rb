require_relative '../spec_helper'

describe DonationListingWorkflow do

  it 'asks model for list of all donations' do
    expect(Donation).to receive(:all)
    subject.call
  end

end