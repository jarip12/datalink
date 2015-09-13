require 'rails_helper'

RSpec.describe "loans/show", type: :view do
  before(:each) do
    @loan = assign(:loan, Loan.create!(
      :notary_type => "Loan Type",
      :description => "Description",
      :amount => 1.5,
      :repay_on_time => false
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Loan Type/)
    expect(rendered).to match(/Description/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/false/)
  end
end
