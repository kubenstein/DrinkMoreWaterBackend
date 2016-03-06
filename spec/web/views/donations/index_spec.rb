require 'spec_helper'

describe Web::Views::Donations::Index do
  let(:view) { Web::Views::Donations::Index }
  let(:donations) do [
            Donation.new(name: 'donation1', created_at: Date.today),
            Donation.new(name: 'donation2', created_at: Date.today)
        ]
  end
  let(:template) { Hanami::View::Template.new('apps/web/templates/donations/index.json.erb') }

  it 'lists all Donations' do
    rendered_view = view.new(template, {donations: donations}).render
    rendered_json = JSON.parse(rendered_view)

    expect(rendered_json['donations'].count).to eq 2
    expect(rendered_json['donations'][0]['name']).to eq 'donation1'
    expect(rendered_json['donations'][1]['name']).to eq 'donation2'
  end

end