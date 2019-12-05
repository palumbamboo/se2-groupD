require 'rails_helper'

RSpec.describe "attendances/show", type: :view do
  before(:each) do
    @attendance = assign(:attendance, Attendance.create!(
      :type => "Type"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
  end
end
