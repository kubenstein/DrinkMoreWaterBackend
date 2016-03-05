require 'spec_helper'

describe Web::Views::Donations::Index do
  let(:good_donation) { Donation.new(id: 1, name: 'good_donation', created_at: Date.today) }
  let(:bad_donation) { Donation.new(id: nil, name: 'bad_donation') }
  let(:template) { Hanami::View::Template.new('apps/web/templates/donations/create.json.erb') }

  it 'returns proper json for successful creation' do
    rendered_view = Web::Views::Donations::Create.new(template, {donation: good_donation}).render
    rendered_json = JSON.parse(rendered_view)

    assert_equal rendered_json['status'], 'success'
    assert_equal rendered_json['donation']['name'], 'good_donation'
    assert_equal rendered_json['donation']['timestamp'], good_donation.created_at.to_time.to_i
  end

  it 'returns proper json for failed creation' do
    rendered_view = Web::Views::Donations::Create.new(template, {donation: bad_donation}).render
    rendered_json = JSON.parse(rendered_view)

    assert_equal rendered_json['status'], 'error'
    assert_equal rendered_json['donation']['name'], 'bad_donation'
    assert_equal rendered_json['donation']['timestamp'], 0
  end

end