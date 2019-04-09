require 'rails_helper'

RSpec.describe "galleries/index", type: :view do
  before(:each) do
    assign(:galleries, [
      Gallery.create!(
        :caption => "Caption",
        :position => 2
      ),
      Gallery.create!(
        :caption => "Caption",
        :position => 2
      )
    ])
  end

  it "renders a list of galleries" do
    render
    assert_select "tr>td", :text => "Caption".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
