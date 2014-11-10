class Donation
  include Persistence
  include Virtus.model

  attribute :name, String
  attribute :created_at, DateTime, default: Proc.new { DateTime.now }
  attribute :fake, Boolean, :default => false

end