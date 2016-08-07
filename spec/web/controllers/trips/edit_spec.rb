require_relative '../../../../apps/web/controllers/trips/edit'

RSpec.describe Web::Controllers::Trips::Edit do
  let(:action) { described_class.new }
  let!(:trip)  { TripRepository.create(build(:trip)) }
  let(:params) do
    {
      'warden' => warden,
      id: trip.id
    }
  end

  before do
    warden.set_user(trip.user)
  end

  it 'returns 200' do
    response = action.call(params)

    expect(response[0]).to eq 200
  end

  it 'exposes the current trip' do
    response = action.call(params)

    expect(action.exposures[:current_trip]).to eq trip
  end

  after do
    TripRepository.clear
    UserRepository.clear
  end
end
