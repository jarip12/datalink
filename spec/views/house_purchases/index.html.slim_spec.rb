require 'rails_helper'

RSpec.describe "house_purchases/index", type: :view do
  before(:each) do
    assign(:house_purchases, [
      HousePurchase.create!(
        :trade_type => "Trade Type",
        :house_type => "House Type",
        :house_address => "House Address",
        :house_amount => "House Amount"
      ),
      HousePurchase.create!(
        :trade_type => "Trade Type",
        :house_type => "House Type",
        :house_address => "House Address",
        :house_amount => "House Amount"
      )
    ])
  end

  it "renders a list of house_purchases" do
    render
    assert_select "tr>td", :text => "Trade Type".to_s, :count => 2
    assert_select "tr>td", :text => "House Type".to_s, :count => 2
    assert_select "tr>td", :text => "House Address".to_s, :count => 2
    assert_select "tr>td", :text => "House Amount".to_s, :count => 2
  end
end
