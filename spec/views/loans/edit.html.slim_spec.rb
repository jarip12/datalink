require 'rails_helper'

RSpec.describe "loans/edit", type: :view do
  before(:each) do
    @loan = assign(:loan, Loan.create!(
      :loan_type => "MyString",
      :description => "MyString",
      :amount => 1.5,
      :repay_on_time => false
    ))
  end

  it "renders the edit loan form" do
    render

    assert_select "form[action=?][method=?]", loan_path(@loan), "post" do

      assert_select "input#loan_loan_type[name=?]", "loan[loan_type]"

      assert_select "input#loan_description[name=?]", "loan[description]"

      assert_select "input#loan_amount[name=?]", "loan[amount]"

      assert_select "input#loan_repay_on_time[name=?]", "loan[repay_on_time]"
    end
  end
end
