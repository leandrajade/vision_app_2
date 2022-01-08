require 'rails_helper'

RSpec.describe "images/index", type: :view do
  before(:each) do
    assign(:images, [
      Image.create!(
        user_id: 2,
        title: "Title",
        caption: "Caption",
        price: 3
      ),
      Image.create!(
        user_id: 2,
        title: "Title",
        caption: "Caption",
        price: 3
      )
    ])
  end

  it "renders a list of images" do
    render
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "Caption".to_s, count: 2
    assert_select "tr>td", text: 3.to_s, count: 2
  end
end
