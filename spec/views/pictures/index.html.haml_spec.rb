require 'rails_helper'

RSpec.describe "pictures/index", type: :view do
  before(:each) do
    assign(:pictures, [
      Picture.create!(
        :caption => "Caption"
      ),
      Picture.create!(
        :caption => "Caption"
      )
    ])
  end

  it "renders a list of pictures" do
    render
    assert_select "tr>td", :text => "Caption".to_s, :count => 2
  end
end
