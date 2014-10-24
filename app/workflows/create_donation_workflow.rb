class CreateDonationWorkflow
  attr_reader :model

  def call(donation_params)
    params = permitted_params(donation_params, Donation.members)
    @model = Donation.new(params)
    @model.save
  end


  private

  def permitted_params(params, permitted_keys)
    params.keep_if { |key, value| permitted_keys.include?(key.to_sym) }
  end

end