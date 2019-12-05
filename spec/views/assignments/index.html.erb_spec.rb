require 'rails_helper'

RSpec.describe "assignments/index", type: :view do
  before(:each) do
    assign(:assignments, [
      Assignment.create!(
        :name => "Name",
        :file => "File"
      ),
      Assignment.create!(
        :name => "Name",
        :file => "File"
      )
    ])
  end

  it "renders a list of assignments" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "File".to_s, :count => 2
  end
end
