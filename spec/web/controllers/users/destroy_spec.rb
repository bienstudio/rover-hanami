require_relative '../../../../apps/web/controllers/users/destroy'

RSpec.describe Web::Controllers::Users::Destroy do
  let(:action) { described_class.new }
  let(:user) { UserRepository.create(build(:user)) }
  let(:params) do
    {
      'warden' => warden
    }
  end

  before do
    warden.set_user(user)
  end

  it 'redirects to the index' do
    response = action.call(params)

    expect(response[0]).to eq 302
    expect(response[1]['Location']).to eq '/'
  end

  it 'deletes the current user' do
    response = action.call(params)

    expect(UserRepository.find(user.id)).to be_nil
  end

  it 'logs out the user' do
    expect(warden).to receive(:logout)

    response = action.call(params)
  end

  after do
    UserRepository.clear
  end
end
