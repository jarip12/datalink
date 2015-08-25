require 'rails_helper'

RSpec.describe "house_purchases/edit", type: :view do
  before(:each) do
    @house_purchase = assign(:house_purchase, HousePurchase.create!(
      :trade_type => "MyString",
      :house_type => "MyString",
      :house_address => "MyString",
      :house_amount => "MyString"
    ))
  end

  it "renders the edit house_purchase form" do
    render

    assert_select "form[action=?][method=?]", house_purchase_path(@house_purchase), "post" do

      assert_select "input#house_purchase_trade_type[name=?]", "house_purchase[trade_type]"

      assert_select "input#house_purchase_house_type[name=?]", "house_purchase[house_type]"

      assert_select "input#house_purchase_house_address[name=?]", "house_purchase[house_address]"

      assert_select "input#house_purchase_house_amount[name=?]", "house_purchase[house_amount]"
    end
  end
end
