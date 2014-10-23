class CreateDonationWorkflow
  attr_reader :model

  def call(params)
    @model = Donation.new(params)
    @model.save
  end

end