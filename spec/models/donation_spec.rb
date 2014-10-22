require_relative '../spec_helper'
#
#
# WHOLE THIS SHOULD BE TESTING LIB/PERSISTANCE NOT DONATION
#
#
describe Donation do
  subject { Donation }
  let(:fake_db) { [] }
  let(:fake_donation_list) do
    [
        {name: 'name1', timestamp: 1412897146},
        {name: 'name2', timestamp: 1413897146},
    ]
  end

  it 'under "all" method, asks db to get all donations' do
    ::DB = fake_db
    dataset = double()
    expect(DB).to receive(:[]).with(:donations).and_return(dataset)
    expect(dataset).to receive(:select).with(:name, :created_at).and_return(fake_donation_list)
    results = subject.all
    expect(results).to have(2).items
    expect(results[0]).to eq(Donation.new('name1', 1412897146))
    expect(results[1]).to eq(Donation.new('name2', 1413897146))
  end

end