class DonationRepository
  include Hanami::Repository

  def self.all
    query do
      where(true)
    end
  end

  def self.all_not_fake
    query do
      where(fake: false)
    end
  end

end
