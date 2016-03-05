require 'spec_helper'

describe Web::Views::Donations::Index do
  let(:donations) do [
            Donation.new(name: 'donation1', created_at: Date.today),
            Donation.new(name: 'donation2', created_at: Date.today)
        ]
  end
  let(:template) { Hanami::View::Template.new('apps/web/templates/donations/index.json.erb') }

  it 'lists all Donations' do
    rendered_view = Web::Views::Donations::Index.new(template, {donations: donations}).render
    rendered_json = JSON.parse(rendered_view)

    assert_equal rendered_json['donations'].count, 2
    assert_equal rendered_json['donations'][0]['name'], 'donation1'
    assert_equal rendered_json['donations'][1]['name'], 'donation2'
  end

end