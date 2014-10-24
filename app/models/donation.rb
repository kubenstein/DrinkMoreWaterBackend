class Donation < Struct.new(:name, :created_at)
  extend StructHashInitialize
  extend Persistence

  def create
    self.created_at = DateTime.now
    super
  end
end