require 'spec_helper'
require_relative '../../../../apps/web/views/donations/create'

describe Web::Views::Donations::Create do
  let(:exposures) { Hash[foo: 'bar'] }
  let(:template)  { Hanami::View::Template.new('apps/web/templates/donations/create.json.erb') }
  let(:view)      { Web::Views::Donations::Create.new(template, exposures) }
  let(:rendered)  { view.render }

  it 'exposes #foo' do
    view.foo.must_equal exposures.fetch(:foo)
  end
end
