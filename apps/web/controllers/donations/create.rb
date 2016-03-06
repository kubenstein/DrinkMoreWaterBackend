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
      if params.valid?
        @donation = DonationRepository.create(
            Donation.new(params[:donation])
        )
      else
        self.status = 422
        @donation = Donation.new(params[:donation])
      end
    end
  end
end
