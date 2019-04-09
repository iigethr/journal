require 'rails_helper'

RSpec.describe "documents/show", type: :view do
  before(:each) do
    @document = assign(:document, Document.create!(
      :caption => "Caption",
      :position => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Caption/)
    expect(rendered).to match(/2/)
  end
end
