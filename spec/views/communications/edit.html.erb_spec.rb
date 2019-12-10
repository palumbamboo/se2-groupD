require 'rails_helper'

RSpec.describe "communications/edit", type: :view do
  before(:each) do
    @communication = assign(:communication, Communication.create!(
      :title => "MyString",
      :description => "MyText",
      :attachment => "MyString"
    ))
  end

  it "renders the edit communication form" do
    render

    assert_select "form[action=?][method=?]", communication_path(@communication), "post" do

      assert_select "input[name=?]", "communication[title]"

      assert_select "textarea[name=?]", "communication[description]"

      assert_select "input[name=?]", "communication[attachment]"
    end
  end
end
