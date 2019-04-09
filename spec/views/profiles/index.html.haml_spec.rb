require 'rails_helper'

RSpec.describe "profiles/index", type: :view do
  before(:each) do
    assign(:profiles, [
      Profile.create!(
        :user => nil,
        :name => "Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name"
      ),
      Profile.create!(
        :user => nil,
        :name => "Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name"
      )
    ])
  end

  it "renders a list of profiles" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
  end
end
