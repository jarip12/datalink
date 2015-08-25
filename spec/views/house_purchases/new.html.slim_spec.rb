require 'rails_helper'

RSpec.describe "house_purchases/new", type: :view do
  before(:each) do
    assign(:house_purchase, HousePurchase.new(
      :trade_type => "MyString",
      :house_type => "MyString",
      :house_address => "MyString",
      :house_amount => "MyString"
    ))
  end

  it "renders new house_purchase form" do
    render

    assert_select "form[action=?][method=?]", house_purchases_path, "post" do

      assert_select "input#house_purchase_trade_type[name=?]", "house_purchase[trade_type]"

      assert_select "input#house_purchase_house_type[name=?]", "house_purchase[house_type]"

      assert_select "input#house_purchase_house_address[name=?]", "house_purchase[house_address]"

      assert_select "input#house_purchase_house_amount[name=?]", "house_purchase[house_amount]"
    end
  end
end
