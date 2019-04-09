require 'rails_helper'

RSpec.describe "documents/index", type: :view do
  before(:each) do
    assign(:documents, [
      Document.create!(
        :caption => "Caption",
        :position => 2
      ),
      Document.create!(
        :caption => "Caption",
        :position => 2
      )
    ])
  end

  it "renders a list of documents" do
    render
    assert_select "tr>td", :text => "Caption".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
