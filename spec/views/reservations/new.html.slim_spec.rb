require 'rails_helper'

RSpec.describe "reservations/new", type: :view do
  before(:each) do
    assign(:reservation, Reservation.new(
      :user_id => 1,
      :notary_type => "MyString"
    ))
  end

  it "renders new reservation form" do
    render

    assert_select "form[action=?][method=?]", reservations_path, "post" do

      assert_select "input#reservation_user_id[name=?]", "reservation[user_id]"

      assert_select "input#reservation_notary_type[name=?]", "reservation[notary_type]"
    end
  end
end
