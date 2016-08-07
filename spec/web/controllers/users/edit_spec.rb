require_relative '../../../../apps/web/controllers/users/edit'

RSpec.describe Web::Controllers::Users::Edit do
  let(:action) { described_class.new }
  let(:user) { UserRepository.create(build(:user)) }
  let(:params) do
    {
      'warden' => warden,
    }
  end

  before do
    warden.set_user(user)
  end

  it 'returns 200' do
    response = action.call(params)

    expect(response[0]).to eq 200
  end
end
