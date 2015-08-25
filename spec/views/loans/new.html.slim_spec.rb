require 'rails_helper'

RSpec.describe "loans/new", type: :view do
  before(:each) do
    assign(:loan, Loan.new(
      :loan_type => "MyString",
      :description => "MyString",
      :amount => 1.5,
      :repay_on_time => false
    ))
  end

  it "renders new loan form" do
    render

    assert_select "form[action=?][method=?]", loans_path, "post" do

      assert_select "input#loan_loan_type[name=?]", "loan[loan_type]"

      assert_select "input#loan_description[name=?]", "loan[description]"

      assert_select "input#loan_amount[name=?]", "loan[amount]"

      assert_select "input#loan_repay_on_time[name=?]", "loan[repay_on_time]"
    end
  end
end
