require_relative '../../../../apps/web/controllers/sessions/new'

RSpec.describe Web::Controllers::Sessions::New do
  let(:action) { described_class.new }

  context 'with a current user' do
    let(:user) { UserRepository.create(build(:user)) }
    let(:params) do
      { 'warden' => warden }
    end

    before do
      warden.set_user(user)
    end

    it 'redirects to the index' do
      response = action.call(params)

      expect(response[0]).to eq 302
      expect(response[1]['Location']).to eq '/'
    end

    after do
      UserRepository.clear
    end
  end

  context 'without a current user' do
    let(:params) { {} }

    it 'returns 200' do
      response = action.call(params)

      expect(response[0]).to eq 200
    end
  end
end
