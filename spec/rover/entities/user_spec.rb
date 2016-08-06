RSpec.describe User do
  let(:user) { build(:user) }

  describe '#password' do
    it 'returns a BCrypt::Password object' do
      expect(user.password).to be_a BCrypt::Password
    end

    it 'is equivalent to the actual password' do
      expect(user.password).to be == 'foobar'
    end
  end

  describe '#password=' do
    it 'sets the digest' do
      user.password = 'barfoo'

      expect(user.password).to be == 'barfoo'
    end
  end

  describe '#password?' do
    it 'checks the equivalence of a digest and an unencrypted password' do
      expect(user.password?('foobar')).to be true
    end
  end
end
