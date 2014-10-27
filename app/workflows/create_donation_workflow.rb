class CreateDonationWorkflow
  attr_reader :model, :model_class

  PERMITTED_FIELDS = [:name]

  def call(donation_params, model_class=Donation)
    @model_class = model_class
    @model = create_model(donation_params)

    if valid?
      @model.save
    else
      false
    end
  end


  private

  def keep_permitted_params(params)
    (params || {}).select { |k, _| PERMITTED_FIELDS.include?(k.to_sym) }
  end

  def create_model(params)
    model_class.new(keep_permitted_params(params))
  end

  def valid?
    !model.name.empty?
  end

end