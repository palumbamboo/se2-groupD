require 'rails_helper'

RSpec.describe "attendances/index", type: :view do
  before(:each) do
    assign(:attendances, [
      Attendance.create!(
        :type => "Type"
      ),
      Attendance.create!(
        :type => "Type"
      )
    ])
  end

  it "renders a list of attendances" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
  end
end
