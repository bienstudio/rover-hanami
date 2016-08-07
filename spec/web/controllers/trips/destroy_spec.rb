require_relative '../../../../apps/web/controllers/trips/destroy'

RSpec.describe Web::Controllers::Trips::Destroy do
  let(:action) { described_class.new }
  let!(:trip) { TripRepository.create(build(:trip)) }
  let(:params) do
    {
      id: trip.id
    }
  end

  it 'destroys a trip' do
    response = action.call(params)

    expect(TripRepository.find(trip.id)).to be_nil
  end

  it 'redirects to the index' do
    response = action.call(params)

    expect(response[0]).to eq 302
    expect(response[1]['Location']).to eq '/'
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
  end

  after do
    TripRepository.clear
    UserRepository.clear
  end
end
