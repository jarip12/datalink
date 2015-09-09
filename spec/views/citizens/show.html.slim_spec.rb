require 'rails_helper'

RSpec.describe "citizens/show", type: :view do
  before(:each) do
    @citizen = assign(:citizen, Citizen.create!(
      :id_no => "Id No",
      :realname => "Realname"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Id No/)
    expect(rendered).to match(/Realname/)
  end
end
