module Web::Controllers::Trips
  class Destroy
    include Web::Action

    params do
      required(:id).filled(:int?)
    end

    def call(params)
      halt 400 unless params.valid?

      trip = TripRepository.find(params[:id])

      TripRepository.delete(trip)

      redirect_to routes.root_path
    end
  end
end
