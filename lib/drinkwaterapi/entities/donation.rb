class Donation
  include Hanami::Entity
  attributes :name, :created_at, :fake

  def fake
    @fake || false
  end
end
