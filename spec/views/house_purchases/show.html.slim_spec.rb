require 'rails_helper'

RSpec.describe "house_purchases/show", type: :view do
  before(:each) do
    @house_purchase = assign(:house_purchase, HousePurchase.create!(
      :trade_type => "Trade Type",
      :house_type => "House Type",
      :house_address => "House Address",
      :house_amount => "House Amount"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Trade Type/)
    expect(rendered).to match(/House Type/)
    expect(rendered).to match(/House Address/)
    expect(rendered).to match(/House Amount/)
  end
end
