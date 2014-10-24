require_relative '../spec_helper'

describe Persistence do
  PERSISTABLE = Struct.new(:attribute1, :attribute2) do
    extend Persistence
  end

  let(:empty_class) { Class.new }
  let(:persistable_class) { PERSISTABLE }


  it 'should provide "all" method to extended class' do
    expect(empty_class).not_to respond_to(:all)
    empty_class.extend Persistence
    expect(empty_class).to respond_to(:all)
  end

  it 'class responds to "all" method' do
    expect(persistable_class).to respond_to :all
  end

  it 'under "all" method, asks db to get all donations using model schema' do
    fake_persistences_list = [
        {attribute1: '1attribute1_value', attribute2: '1attribute2_value'},
        {attribute1: '2attribute1_value', attribute2: '2attribute2_value'}
    ]

    db_entity = double
    expect(DB).to receive(:[]).with(:persistables).and_return(db_entity)
    expect(db_entity).to receive(:select).with(:attribute1, :attribute2).and_return(fake_persistences_list)
    results = persistable_class.all

    expect(results).to have(2).items
    expect(results[0]).to eq(persistable_class.new('1attribute1_value', '1attribute2_value'))
    expect(results[1]).to eq(persistable_class.new('2attribute1_value', '2attribute2_value'))
  end

  it 'object responds to "create" method' do
    expect(persistable_class.new).to respond_to :create
  end

  it 'under "create" method, commands db to save object' do
    persistable_object = persistable_class.new('attribute2_value', 'attribute1_value')

    db_entity = double
    expect(DB).to receive(:[]).with(:persistables).and_return(db_entity)
    expect(db_entity).to receive(:insert).with({attribute1: 'attribute2_value', attribute2: 'attribute1_value'})
    persistable_object.create
  end

end