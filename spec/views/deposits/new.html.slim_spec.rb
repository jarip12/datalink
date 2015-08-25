require 'rails_helper'

RSpec.describe "deposits/new", type: :view do
  before(:each) do
    assign(:deposit, Deposit.new(
      :amount => 1.5
    ))
  end

  it "renders new deposit form" do
    render

    assert_select "form[action=?][method=?]", deposits_path, "post" do

      assert_select "input#deposit_amount[name=?]", "deposit[amount]"
    end
  end
end
