require_relative '../../../../apps/web/controllers/trips/update'

RSpec.describe Web::Controllers::Trips::Update do
  let(:action) { described_class.new }
  let!(:trip)   { TripRepository.create(build(:trip)) }
  let!(:params) do
    {
      'warden' => warden,
      id: trip.id,
      trip: {
        name: 'London Trip'
      }
    }
  end

  before do
    warden.set_user(trip.user)
  end

  it 'exposes an updated trip' do
    response = action.call(params)

    expect(action.exposures[:trip]).to be_a Trip
    expect(action.exposures[:trip].id).to eq trip.id
    expect(action.exposures[:trip].name).to eq 'London Trip'
  end

  it 'redirects to the trip page' do
    response = action.call(params)

    expect(response[0]).to eq 302
    expect(response[1]['Location']).to eq "/trips/#{action.exposures[:trip].id}"
  end

  describe 'params' do
    it 'returns 400 for invalid params' do
      response = action.call({})

      expect(response[0]).to eq 400
    end

    it 'rejects without an id' do
      response = action.call({})

      expect(action.params.errors[:id]).to include 'is missing'
    end

    it 'rejects without a trip hash' do
      response = action.call({})

      expect(action.params.errors[:trip]).to include 'is missing'
    end

    it 'rejects without a name' do
      response = action.call({ trip: {} })

      expect(action.params.errors[:trip][:name]).to include 'is missing'
    end
  end

  after do
    UserRepository.clear
    TripRepository.clear
  end
end
