require 'spec_helper'

describe Web::Views::Donations::Create do
  let(:view) { Web::Views::Donations::Create }
  let(:good_donation) { Donation.new(id: 1, name: 'good_donation', created_at: Date.today) }
  let(:bad_donation) { Donation.new(id: nil, name: 'bad_donation') }
  let(:template) { Hanami::View::Template.new('apps/web/templates/donations/create.json.erb') }

  it 'returns proper json for successful creation' do
    rendered_view = view.new(template, {donation: good_donation}).render
    rendered_json = JSON.parse(rendered_view)

    expect(rendered_json['status']).to eq 'success'
    expect(rendered_json['donation']['name']).to eq 'good_donation'
    expect(rendered_json['donation']['timestamp']).to eq good_donation.created_at.to_time.to_i
  end

  it 'returns proper json for failed creation' do
    rendered_view = view.new(template, {donation: bad_donation}).render
    rendered_json = JSON.parse(rendered_view)

    expect(rendered_json['status']).to eq 'error'
    expect(rendered_json['donation']['name']).to eq 'bad_donation'
    expect(rendered_json['donation']['timestamp']).to eq 0
  end

end