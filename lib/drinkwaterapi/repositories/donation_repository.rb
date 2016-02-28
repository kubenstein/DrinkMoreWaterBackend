class DonationRepository
  include Hanami::Repository

  def self.all_not_fake
    query do
      where(fake: false)
    end
  end

end
