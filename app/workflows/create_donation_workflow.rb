class CreateDonationWorkflow
  attr_reader :model, :model_class

  def call(donation_params, model_class=Donation)
    @model_class = model_class
    @model = create_model(donation_params)

    if valid?
      @model.create
    else
      false
    end
  end


  private

  def permitted_params_values(params)
    params ||= {}
    ordered_permitted_values = []
    permitted_keys = model_class.members

    permitted_keys.each { |permitted_key| ordered_permitted_values << params[permitted_key.to_s] }
    ordered_permitted_values.compact
  end

  def create_model(params)
    model_class.new(*permitted_params_values(params))
  end

  def valid?
    !model.name.empty?
  end

end