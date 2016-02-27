module Web::Controllers::Donations
  class Create
    include Web::Action

    expose :donation

    def call(params)
      @donation = DonationRepository.create(
          Donation.new(params[:donation])
      )
    end
  end
end
