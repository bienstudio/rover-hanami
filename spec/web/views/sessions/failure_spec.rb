require_relative '../../../../apps/web/views/sessions/failure'

RSpec.describe Web::Views::Sessions::Failure do
  let(:template)  { Hanami::View::Template.new('apps/web/templates/sessions/failure.html.haml') }
  let(:view)      { described_class.new(template, {}) }
  let(:rendered)  { view.render }
end
