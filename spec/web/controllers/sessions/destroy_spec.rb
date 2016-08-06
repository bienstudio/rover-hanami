require_relative '../../../../apps/web/controllers/sessions/destroy'

RSpec.describe Web::Controllers::Sessions::Destroy do
  let(:action) { described_class.new }
  let(:params) do
    { 'warden' => warden }
  end

  it 'calls logout on Warden' do
    expect(warden).to receive(:logout)

    response = action.call(params)
  end

  it 'redirects to the index' do
    response = action.call(params)

    expect(response[0]).to eq 302
    expect(response[1]['Location']).to eq '/'
  end
end
