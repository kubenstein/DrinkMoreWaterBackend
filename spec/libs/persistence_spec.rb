require_relative '../spec_helper'

describe Persistence do
  PERSISTABLE = Struct.new(:attribute1, :attribute2) do
    extend Persistence
  end

  let(:fake_db) { [] }
  let(:empty_class) { Class.new }
  let(:persistable_class) { PERSISTABLE }


  it 'should provide "all" method to extended class' do
    expect(empty_class).not_to respond_to(:all)
    empty_class.extend Persistence
    expect(empty_class).to respond_to(:all)
  end

  it 'under "all" method, asks db to get all donations using model schema' do
    fake_persistences_list = [
        {attribute1: '1attribute1_value', attribute2: '1attribute2_value'},
        {attribute1: '2attribute1_value', attribute2: '2attribute2_value'}
    ]

    ::DB = fake_db
    dataset = double
    expect(DB).to receive(:[]).with(:persistables).and_return(dataset)
    expect(dataset).to receive(:select).with(:attribute1, :attribute2).and_return(fake_persistences_list)
    results = persistable_class.all
    expect(results).to have(2).items

    expect(results[0]).to eq(PERSISTABLE.new('1attribute1_value', '1attribute2_value'))
    expect(results[1]).to eq(PERSISTABLE.new('2attribute1_value', '2attribute2_value'))
  end

  xit 'under "save" method, commands db to save object' do
  end

end