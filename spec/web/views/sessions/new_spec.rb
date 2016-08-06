require_relative '../../../../apps/web/views/sessions/new'

RSpec.describe Web::Views::Sessions::New do
  let(:template)  { Hanami::View::Template.new('apps/web/templates/sessions/new.html.haml') }
  let(:view)      { described_class.new(template, {}) }
  let(:rendered)  { view.render }
end
