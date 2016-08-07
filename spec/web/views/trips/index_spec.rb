require_relative '../../../../apps/web/views/trips/index'

RSpec.describe Web::Views::Trips::Index do
  let(:exposures) { Hash[trips: []] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/trips/index.html.haml') }
  let(:view)      { described_class.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #trips' do
    expect(view.trips).to eq exposures.fetch(:trips)
  end
end
