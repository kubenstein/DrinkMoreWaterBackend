class CreateDonationWorkflow
  attr_reader :model

  def call(donation_params)
    params_values = permitted_params_values(donation_params, Donation.members)
    @model = Donation.new(*params_values)
    @model.create
  end


  private

  def permitted_params_values(params={}, permitted_keys)
    ordered_permitted_values = []
    permitted_keys.each { |permitted_key| ordered_permitted_values << params[permitted_key.to_s] }
    ordered_permitted_values.compact
  end

end