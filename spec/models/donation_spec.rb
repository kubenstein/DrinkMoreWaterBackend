require_relative '../spec_helper'

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
    expect(DB).to receive(:[]).with(:donations).and_return(fake_donation_list)
    results = subject.all
    expect(results).to have(2).items
    expect(results[0]).to eq(fake_donation_list[0])
    expect(results[1]).to eq(fake_donation_list[1])
  end

end