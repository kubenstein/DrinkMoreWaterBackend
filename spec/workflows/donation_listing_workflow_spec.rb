require_relative '../spec_helper'

describe 'DonationListingWorkflow' do

  let(:fake_donation_list) do
    [
        {name: 'name1', timestamp: 1412897146},
        {name: 'name2', timestamp: 1413897146},
    ]
  end

  it 'lists all donations' do
    expect(Donation).to receive(:all).and_return(fake_donation_list)
    results = DonationListingWorkflow.new.call
    expect(results).to have(2).items
    expect(results[0]).to eq(fake_donation_list[0])
    expect(results[1]).to eq(fake_donation_list[1])
  end

end