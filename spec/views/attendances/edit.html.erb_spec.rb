require 'rails_helper'

RSpec.describe "attendances/edit", type: :view do
  before(:each) do
    @attendance = assign(:attendance, Attendance.create!(
      :type => ""
    ))
  end

  it "renders the edit attendance form" do
    render

    assert_select "form[action=?][method=?]", attendance_path(@attendance), "post" do

      assert_select "input[name=?]", "attendance[type]"
    end
  end
end
