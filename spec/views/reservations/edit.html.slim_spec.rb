require 'rails_helper'

RSpec.describe "reservations/edit", type: :view do
  before(:each) do
    @reservation = assign(:reservation, Reservation.create!(
      :user_id => 1,
      :notary_type => "MyString"
    ))
  end

  it "renders the edit reservation form" do
    render

    assert_select "form[action=?][method=?]", reservation_path(@reservation), "post" do

      assert_select "input#reservation_user_id[name=?]", "reservation[user_id]"

      assert_select "input#reservation_notary_type[name=?]", "reservation[notary_type]"
    end
  end
end
