class Donation < Struct.new(:name, :created_at)
  extend StructHashInitialize
  extend Persistence
end