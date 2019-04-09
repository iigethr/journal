require 'rails_helper'

RSpec.describe "documents/edit", type: :view do
  before(:each) do
    @document = assign(:document, Document.create!(
      :caption => "MyString",
      :position => 1
    ))
  end

  it "renders the edit document form" do
    render

    assert_select "form[action=?][method=?]", document_path(@document), "post" do

      assert_select "input[name=?]", "document[caption]"

      assert_select "input[name=?]", "document[position]"
    end
  end
end
