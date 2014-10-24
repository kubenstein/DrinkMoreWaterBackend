class Donation < Struct.new(:name, :created_at)
  extend Persistence
end