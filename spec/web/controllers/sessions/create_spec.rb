require 'pry'

require_relative '../../../../apps/web/controllers/sessions/create'

RSpec.describe Web::Controllers::Sessions::Create do
  let(:action) { described_class.new }
  let(:user)   { UserRepository.create(build(:user)) }
  let(:base_params) do
    {
      'warden' => warden
    }
  end

  context 'correct credentials' do
    let(:params) do
      base_params.merge({
        email: user.email,
        password: 'foobar'
      })
    end

    it 'sets the current user' do
      expect(warden).to receive(:set_user).with(user)

      response = action.call(params)
    end

    it 'redirects to the index' do
      response = action.call(params)

      expect(response[0]).to eq 302
      expect(response[1]['Location']).to eq '/'
    end
  end

  context 'incorrect credentials' do
    let(:params) do
      base_params.merge({
        email: 'foo@bar',
        password: 'foobar'
      })
    end

    it 'does not set the Warden user' do
      expect(warden).to_not receive(:set_user)

      response = action.call(params)
    end

    it 'redirects back to the login page' do
      response = action.call(params)

      expect(response[0]).to eq 302
      expect(response[1]['Location']).to eq '/login'
    end
  end

  describe 'params' do
    it 'returns 400 for invalid params' do
      response = action.call({})

      expect(response[0]).to eq 400
    end

    it 'rejects without an email' do
      response = action.call({ user: {} })

      expect(action.params.errors[:email]).to include 'is missing'
    end

    it 'rejects without a password' do
      response = action.call({})

      expect(action.params.errors[:password]).to include 'is missing'
    end
  end

  after do
    UserRepository.clear
  end
end
