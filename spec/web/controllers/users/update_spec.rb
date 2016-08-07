require_relative '../../../../apps/web/controllers/users/update'

RSpec.describe Web::Controllers::Users::Update do
  let(:action) { described_class.new }
  let(:user) { UserRepository.create(build(:user)) }
  let(:params) do
    {
      'warden' => warden,
      user: {
        name: 'Douglas Adams'
      }
    }
  end

  before do
    warden.set_user(user)
  end

  it 'redirects to the account page' do
    response = action.call(params)

    expect(response[0]).to eq 302
    expect(response[1]['Location']).to eq '/account'
  end

  it 'updates the current user' do
    response = action.call(params)

    expect(action.exposures[:current_user].name).to eq 'Douglas Adams'
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
  end

  after do
    UserRepository.clear
  end
end
