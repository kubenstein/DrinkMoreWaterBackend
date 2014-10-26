require_relative '../spec_helper'


describe Persistence do
  let(:empty_class) { EmptyClass }
  let(:persistable_class) { DummyPersistable }

  it 'should provide "all" method to included class' do
    expect(empty_class).not_to respond_to(:all)
    empty_class.include Persistence
    expect(empty_class).to respond_to(:all)
  end

  it 'class responds to "all" method' do
    expect(persistable_class).to respond_to :all
  end

  it 'under "all" method, asks db to get all donations' do
    fake_persistences_list_from_persistence_layer = [
        persistable_class.new(attribute1: '1attribute1_value', attribute2: '1attribute2_value'),
        persistable_class.new(attribute1: '2attribute1_value', attribute2: '2attribute2_value')
    ]

    expect(persistable_class.persistence_layer).to receive(:all).and_return(fake_persistences_list_from_persistence_layer)
    results = persistable_class.all

    expect(results).to have(2).items
    expect(results[0]).to eq persistable_class.new(attribute1: '1attribute1_value', attribute2: '1attribute2_value')
    expect(results[1]).to eq persistable_class.new(attribute1: '2attribute1_value', attribute2: '2attribute2_value')
  end

  it 'object responds to "save" method' do
    expect(persistable_class.new).to respond_to :save
  end

  it 'under "save" method, commands db to save object' do
    db_entity = double
    expect(persistable_class.persistence_layer).to receive(:new).with(attribute1: 'attribute2_value', attribute2: 'attribute1_value').and_return(db_entity)
    expect(db_entity).to receive(:save)

    persistable_object = persistable_class.new(attribute1: 'attribute2_value', attribute2: 'attribute1_value')
    persistable_object.save
  end

end

class EmptyClass
end

class DummyPersistable < OpenStruct
  include Persistence
  def attributes; to_h end
end