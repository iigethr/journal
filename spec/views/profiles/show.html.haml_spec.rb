require 'rails_helper'

RSpec.describe "profiles/show", type: :view do
  before(:each) do
    @profile = assign(:profile, Profile.create!(
      :user => nil,
      :name => "Name",
      :middle_name => "Middle Name",
      :last_name => "Last Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Middle Name/)
    expect(rendered).to match(/Last Name/)
  end
end
