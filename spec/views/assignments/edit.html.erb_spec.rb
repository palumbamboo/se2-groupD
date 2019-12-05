require 'rails_helper'

RSpec.describe "assignments/edit", type: :view do
  before(:each) do
    @assignment = assign(:assignment, Assignment.create!(
      :name => "MyString",
      :file => "MyString"
    ))
  end

  it "renders the edit assignment form" do
    render

    assert_select "form[action=?][method=?]", assignment_path(@assignment), "post" do

      assert_select "input[name=?]", "assignment[name]"

      assert_select "input[name=?]", "assignment[file]"
    end
  end
end
