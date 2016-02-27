module Web::Controllers::Donations
  class Index
    include Web::Action

    expose :donations

    def call(params)
      @donations = DonationRepository.all
    end
  end
end
