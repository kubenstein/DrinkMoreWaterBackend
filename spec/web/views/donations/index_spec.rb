# require 'spec_helper'
# require_relative '../../../../apps/web/views/donations/index'
#
# describe Web::Views::Donations::Index do
#   let(:exposures) { Hash[foo: 'bar'] }
#   let(:template)  { Hanami::View::Template.new('apps/web/templates/donations/index.json.erb') }
#   let(:view)      { Web::Views::Donations::Index.new(template, exposures) }
#   let(:rendered)  { view.render }
#
#   it 'exposes #foo' do
#     view.foo.must_equal exposures.fetch(:foo)
#   end
# end
