module Web::Controllers::Trips
  class Create
    include Web::Action

    expose :trip

    params do
      required(:trip).schema do
        required(:name).filled(:str?)
        optional(:start_date).filled(:date?)
        optional(:end_date).filled(:date?)
      end
    end

    def call(params)
      halt 400 unless params.valid?

      @trip = Trip.new(params[:trip])
      @trip.user = current_user

      @trip = TripRepository.create(@trip)

      redirect_to routes.trip_path(id: @trip.id)
    end
  end
end
