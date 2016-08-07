require 'core_ext/integer'

require_relative '../../../../apps/web/controllers/trips/create'

RSpec.describe Web::Controllers::Trips::Create do
  let(:action) { described_class.new }
  let(:user)   { UserRepository.create(build(:user)) }
  let(:params) do
    {
      'warden' => warden,
      trip: {
        name: 'Trip to London',
        start_date: Date.today,
        end_date: Date.today + 10.days
      }
    }
  end

  before do
    warden.set_user(user)
  end

  it 'exposes a new trip' do
    response = action.call(params)

    expect(action.exposures[:trip]).to be_a Trip
    expect(action.exposures[:trip].name).to eq 'Trip to London'
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
