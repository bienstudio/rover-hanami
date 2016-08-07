RSpec.describe Trip do
  let(:trip) { build(:trip) }
  let(:user) { trip.user }
  let(:outsider) { build(:user) }

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

  describe '#viewable_by?' do
    it 'allows the owner' do
      expect(trip.viewable_by?(trip.user)).to be true
    end

    it 'denies others' do
      expect(trip.viewable_by?(outsider)).to be false
    end
  end

  describe '#creatable_by?' do
    it 'allows all' do
      expect(trip.creatable_by?(outsider)).to be true
    end
  end

  describe '#updatable_by?' do
    it 'allows the owner' do
      expect(trip.updatable_by?(trip.user)).to be true
    end

    it 'denies others' do
      expect(trip.updatable_by?(outsider)).to be false
    end
  end

  describe '#destroyable_by?' do
    it 'allows the owner' do
      expect(trip.destroyable_by?(trip.user)).to be true
    end

    it 'denies others' do
      expect(trip.destroyable_by?(outsider)).to be false
    end
  end

  after do
    UserRepository.clear
  end
end
