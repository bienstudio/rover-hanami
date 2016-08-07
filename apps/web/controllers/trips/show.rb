module Web::Controllers::Trips
  class Show
    include Web::Action

    expose :current_trip

    def call(params)
      @current_trip = TripRepository.find(params[:id])
    end
  end
end
