class DonationListingWorkflow

  def call
    Donation.reverse_order(:id)
  end

end