require_relative '../../../../apps/web/controllers/trips/index'

RSpec.describe Web::Controllers::Trips::Index do
  let(:action)  { described_class.new }
  let!(:user)   { UserRepository.create(build(:user)) }
  let!(:trip)   { TripRepository.create(build(:trip, user_id: user.id)) }
  let(:params) do
    { 'warden' => warden }
  end

  before do
    warden.set_user(user)
  end

  it 'exposes trips' do
    response = action.call(params)

    expect(action.exposures[:trips]).to include trip
  end

  it 'returns 200' do
    response = action.call(params)

    expect(response[0]).to eq 200
  end

  after do
    UserRepository.clear
    TripRepository.clear
  end
end
