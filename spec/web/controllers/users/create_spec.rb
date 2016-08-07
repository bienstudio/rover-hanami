require_relative '../../../../apps/web/controllers/users/create'

RSpec.describe Web::Controllers::Users::Create do
  let(:action) { described_class.new }
  let(:params) do
    {
      'warden' => warden,
      user: {
        name: 'Ernest Shackleton',
        email: generate(:email),
        password: 'foobar'
      }
    }
  end

  it 'exposes a new user' do
    response = action.call(params)

    expect(action.exposures[:user]).to be_a User
    expect(action.exposures[:user].email).to eq params[:user]['email']
  end

  it 'sets the current user' do
    expect(warden).to receive(:set_user)

    response = action.call(params)
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

    it 'rejects without a user hash' do
      response = action.call({})

      expect(action.params.errors[:user]).to include 'is missing'
    end

    it 'rejects without a name' do
      response = action.call({ user: {} })

      expect(action.params.errors[:user][:name]).to include 'is missing'
    end

    it 'rejects without an email' do
      response = action.call({ user: {} })

      expect(action.params.errors[:user][:email]).to include 'is missing'
    end

    it 'rejects without a properly formatted email' do
      response = action.call({ user: { email: 'foobar' } })

      expect(action.params.errors[:user][:email]).to include 'is in invalid format'
    end

    it 'rejects without a password' do
      response = action.call({ user: {} })

      expect(action.params.errors[:user][:password]).to include 'is missing'
    end
  end

  after do
    UserRepository.clear
  end
end
