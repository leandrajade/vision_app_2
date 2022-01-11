require 'rails_helper'

RSpec.describe "galleries/new", type: :view do
  before(:each) do
    assign(:gallery, Gallery.new(
      title: "MyString",
      caption: "MyString"
    ))
  end

  it "renders new gallery form" do
    render

    assert_select "form[action=?][method=?]", galleries_path, "post" do

      assert_select "input[name=?]", "gallery[title]"

      assert_select "input[name=?]", "gallery[caption]"
    end
  end
end
