require 'rails_helper'

RSpec.describe "galleries/edit", type: :view do
  before(:each) do
    @gallery = assign(:gallery, Gallery.create!(
      :caption => "MyString",
      :position => 1
    ))
  end

  it "renders the edit gallery form" do
    render

    assert_select "form[action=?][method=?]", gallery_path(@gallery), "post" do

      assert_select "input[name=?]", "gallery[caption]"

      assert_select "input[name=?]", "gallery[position]"
    end
  end
end
