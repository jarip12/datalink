require 'rails_helper'

RSpec.describe "loans/index", type: :view do
  before(:each) do
    assign(:loans, [
      Loan.create!(
        :notary_type => "Loan Type",
        :description => "Description",
        :amount => 1.5,
        :repay_on_time => false
      ),
      Loan.create!(
        :notary_type => "Loan Type",
        :description => "Description",
        :amount => 1.5,
        :repay_on_time => false
      )
    ])
  end

  it "renders a list of loans" do
    render
    assert_select "tr>td", :text => "Loan Type".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => false.to_s, :count => 2
  end
end
