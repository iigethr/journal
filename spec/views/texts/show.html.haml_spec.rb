require 'rails_helper'

RSpec.describe "texts/show", type: :view do
  before(:each) do
    @text = assign(:text, Text.create!(
      :body => "MyText",
      :position => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
