collection :donations do
  entity Donation
  repository DonationRepository

  attribute :id, Integer
  attribute :name, String
  attribute :created_at, DateTime
  attribute :fake, Boolean
end