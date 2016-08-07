require_relative '../../../../apps/web/controllers/trips/new'

RSpec.describe Web::Controllers::Trips::New do
  let(:action) { described_class.new }
  let(:params) { Hash[] }

  it 'returns 200' do
    response = action.call(params)
    
    expect(response[0]).to eq 200
  end
end
