module Web::Controllers::Trips
  class Index
    include Web::Action

    before :require_authentication!

    expose :trips

    def call(params)
      @trips = TripRepository.for_user(current_user).all
    end
  end
end
