require_relative '../../../../apps/web/controllers/trips/show'

RSpec.describe Web::Controllers::Trips::Show do
  let(:action) { described_class.new }
  let(:trip)   { TripRepository.create(build(:trip)) }
  let(:params) { { id: trip.id } }

  it 'returns 200' do
    response = action.call(params)

    expect(response[0]).to eq 200
  end

  it 'exposes the current trip' do
    response = action.call(params)

    expect(action.exposures[:current_trip]).to eq trip
  end
end
