require 'rails_helper'

RSpec.describe "deposits/show", type: :view do
  before(:each) do
    @deposit = assign(:deposit, Deposit.create!(
      :amount => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
  end
end
