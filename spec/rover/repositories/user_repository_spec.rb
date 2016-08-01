RSpec.describe UserRepository do
  describe '.find_by_email' do
    let(:user) { UserRepository.create(build(:user)) }

    it 'finds the first user with a given email address' do
      query = UserRepository.find_by_email(user.email)

      expect(query).to eq user
    end

    it 'returns nil for no matches' do
      query = UserRepository.find_by_email('foobar')

      expect(query).to be_nil
    end
  end
end
