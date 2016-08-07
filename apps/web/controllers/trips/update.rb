module Web::Controllers::Trips
  class Update
    include Web::Action

    expose :trip

    params do
      required(:id).filled(:int?)
      required(:trip).schema do
        required(:name).filled(:str?)
        optional(:start_date).filled(:date?)
        optional(:end_date).filled(:date?)
      end
    end

    def call(params)
      halt 400 unless params.valid?

      @trip = TripRepository.find(params[:id])

      @trip.name =        params[:trip][:name]        if params[:trip][:name]
      @trip.start_date =  params[:trip][:start_date]  if params[:trip][:start_date]
      @trip.end_date =    params[:trip][:end_date]    if params[:trip][:end_date]

      @trip = TripRepository.update(@trip)

      redirect_to routes.trip_path(id: @trip.id)
    end
  end
end
