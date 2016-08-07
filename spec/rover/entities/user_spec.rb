RSpec.describe User do
  let(:user) { build(:user) }
  let(:outsider) { build(:user) }

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

  describe '#viewable_by?' do
    it 'allows the same user' do
      expect(user.viewable_by?(user)).to be true
    end

    it 'denies everyone else' do
      expect(user.viewable_by?(outsider)).to be false
    end
  end

  describe '#creatable_by?' do
    it 'allows the everyone' do
      expect(user.creatable_by?(outsider)).to be true
    end
  end

  describe '#updatable_by?' do
    it 'allows the same user' do
      expect(user.updatable_by?(user)).to be true
    end

    it 'denies everyone else' do
      expect(user.updatable_by?(outsider)).to be false
    end
  end

  describe '#destroyable_by?' do
    it 'allows the same user' do
      expect(user.destroyable_by?(user)).to be true
    end

    it 'denies everyone else' do
      expect(user.destroyable_by?(outsider)).to be false
    end
  end
end
