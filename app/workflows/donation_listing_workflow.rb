class DonationListingWorkflow

  def call
    Donation.all
  end

end