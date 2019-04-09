require 'rails_helper'

RSpec.describe "videos/index", type: :view do
  before(:each) do
    assign(:videos, [
      Video.create!(
        :caption => "Caption"
      ),
      Video.create!(
        :caption => "Caption"
      )
    ])
  end

  it "renders a list of videos" do
    render
    assert_select "tr>td", :text => "Caption".to_s, :count => 2
  end
end
