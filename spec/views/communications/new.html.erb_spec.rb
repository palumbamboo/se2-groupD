require 'rails_helper'

RSpec.describe "communications/new", type: :view do
  before(:each) do
    assign(:communication, Communication.new(
      :title => "MyString",
      :description => "MyText",
      :attachment => "MyString"
    ))
  end

  it "renders new communication form" do
    render

    assert_select "form[action=?][method=?]", communications_path, "post" do

      assert_select "input[name=?]", "communication[title]"

      assert_select "textarea[name=?]", "communication[description]"

      assert_select "input[name=?]", "communication[attachment]"
    end
  end
end
