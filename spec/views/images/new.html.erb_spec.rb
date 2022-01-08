require 'rails_helper'

RSpec.describe "images/new", type: :view do
  before(:each) do
    assign(:image, Image.new(
      user_id: 1,
      title: "MyString",
      caption: "MyString",
      price: 1
    ))
  end

  it "renders new image form" do
    render

    assert_select "form[action=?][method=?]", images_path, "post" do

      assert_select "input[name=?]", "image[user_id]"

      assert_select "input[name=?]", "image[title]"

      assert_select "input[name=?]", "image[caption]"

      assert_select "input[name=?]", "image[price]"
    end
  end
end
