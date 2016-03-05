module Web::Controllers::Donations
  class Create
    include Web::Action

    expose :donation

    params do
      param :donation do
        param :name, presence: true
      end
    end
    def call(params)
      @donation = if params.valid?
                    DonationRepository.create(
                        Donation.new(params[:donation])
                    )
                  else
                    Donation.new(params[:donation])
                  end
    end
  end
end
