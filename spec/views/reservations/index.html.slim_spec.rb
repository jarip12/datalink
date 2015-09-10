require 'rails_helper'

RSpec.describe "reservations/index", type: :view do
  before(:each) do
    assign(:reservations, [
      Reservation.create!(
        :user_id => 1,
        :notary_type => "Notary Type"
      ),
      Reservation.create!(
        :user_id => 1,
        :notary_type => "Notary Type"
      )
    ])
  end

  it "renders a list of reservations" do
    render
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => "Notary Type".to_s, :count => 2
  end
end
