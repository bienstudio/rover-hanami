RSpec.describe Trip do
  let(:trip) { build(:trip) }

  describe '#user' do
    let(:user) { UserRepository.create(build(:user)) }
    let(:trip) { build(:trip, user_id: user.id) }

    it 'returns the user associated with the trip\'s user_id' do
      expect(trip.user).to eq user
    end
  end

  describe '#user=' do
    let(:user) { UserRepository.create(build(:user)) }

    before do
      trip.user = user
    end

    it 'sets the new user_id' do
      expect(trip.user_id).to eq user.id
    end
  end

  after do
    UserRepository.clear
  end
end
