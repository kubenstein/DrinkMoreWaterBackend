module Web::Controllers::Donations
  class Index
    include Web::Action

    expose :donations

    def call(params)
      @donations = DonationRepository.all.reverse_order(:created_at)
    end
  end
end
