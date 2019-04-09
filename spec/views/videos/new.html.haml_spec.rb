require 'rails_helper'

RSpec.describe "videos/new", type: :view do
  before(:each) do
    assign(:video, Video.new(
      :caption => "MyString"
    ))
  end

  it "renders new video form" do
    render

    assert_select "form[action=?][method=?]", videos_path, "post" do

      assert_select "input[name=?]", "video[caption]"
    end
  end
end
