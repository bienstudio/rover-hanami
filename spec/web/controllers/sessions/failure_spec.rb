require_relative '../../../../apps/web/controllers/sessions/failure'

RSpec.describe Web::Controllers::Sessions::Failure do
  let(:action) { described_class.new }

  it 'is successful' do
    response = action.call({})

    expect(response[0]).to eq 200
  end
end
