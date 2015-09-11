require 'rails_helper'

RSpec.describe "archives/show", type: :view do
  before(:each) do
    @archive = assign(:archive, Archive.create!(
      :realname => "Realname",
      :id_no => "Id No",
      :user_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Realname/)
    expect(rendered).to match(/Id No/)
    expect(rendered).to match(/1/)
  end
end
