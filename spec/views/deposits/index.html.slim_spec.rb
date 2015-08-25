require 'rails_helper'

RSpec.describe "deposits/index", type: :view do
  before(:each) do
    assign(:deposits, [
      Deposit.create!(
        :amount => 1.5
      ),
      Deposit.create!(
        :amount => 1.5
      )
    ])
  end

  it "renders a list of deposits" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
