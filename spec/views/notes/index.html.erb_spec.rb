require 'rails_helper'

RSpec.describe "notes/index", type: :view do
  before(:each) do
    assign(:notes, [
      Note.create!(
        :subject => "Subject",
        :description => "Description"
      ),
      Note.create!(
        :subject => "Subject",
        :description => "Description"
      )
    ])
  end

  it "renders a list of notes" do
    render
    assert_select "tr>td", :text => "Subject".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
