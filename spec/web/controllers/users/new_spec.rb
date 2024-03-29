require_relative '../../../../apps/web/controllers/users/new'

RSpec.describe Web::Controllers::Users::New do
  let(:action) { described_class.new }
  let(:params) { {} }

  it 'returns 200' do
    response = action.call(params)

    expect(response[0]).to eq 200
  end
end
