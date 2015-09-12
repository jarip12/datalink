require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :realname => "Realname",
      :id_no => "Id No",
      :sex => "Sex",
      :mobile => "Mobile",
      :address => "Address",
      :archive_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Realname/)
    expect(rendered).to match(/Id No/)
    expect(rendered).to match(/Sex/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/1/)
  end
end
