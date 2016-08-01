RSpec.describe TripRepository do
  describe '.for_user' do
    let!(:user1) { UserRepository.create(build(:user)) }
    let!(:user2) { UserRepository.create(build(:user)) }
    let!(:trip1) { TripRepository.create(build(:trip, user_id: user1.id)) }
    let!(:trip2) { TripRepository.create(build(:trip, user_id: user1.id)) }

    it 'returns a query object' do
      query = TripRepository.for_user(user1)

      expect(query).to be_a Hanami::Model::Adapters::Sql::Query
    end

    it 'returns all trips for a given user' do
      query = TripRepository.for_user(user1).all

      expect(query).to match_array [trip1, trip2]
    end

    it 'returns an empty array for user without trips' do
      query = TripRepository.for_user(user2).all

      expect(query).to eq []
    end
  end

  after do
    UserRepository.clear
    TripRepository.clear
  end
end
