require_relative '../../../../apps/web/controllers/sessions/new'

RSpec.describe Web::Controllers::Sessions::New do
  let(:action) { described_class.new }

  it 'returns 200' do
    response = action.call({})
    
    expect(response[0]).to eq 200
  end
end
