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

  describe '.authenticate' do
    let(:user) { UserRepository.create(build(:user)) }

    it 'returns the first user matching the credentials' do
      query = UserRepository.authenticate(
        email: user.email,
        password: 'foobar'
      )

      expect(query).to eq user
    end

    it 'returns nil for an incorrect email' do
      query = UserRepository.authenticate(
        email: 'foobar',
        password: 'foobar'
      )

      expect(query).to be_nil
    end

    it 'returns nil for an incorrect password' do
      query = UserRepository.authenticate(
        email: user.email,
        password: 'barfoo'
      )

      expect(query).to be_nil
    end
  end

  after do
    UserRepository.clear
  end
end
