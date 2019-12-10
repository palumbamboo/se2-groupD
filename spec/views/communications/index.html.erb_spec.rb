require 'rails_helper'

RSpec.describe "communications/index", type: :view do
  before(:each) do
    assign(:communications, [
      Communication.create!(
        :title => "Title",
        :description => "MyText",
        :attachment => "Attachment"
      ),
      Communication.create!(
        :title => "Title",
        :description => "MyText",
        :attachment => "Attachment"
      )
    ])
  end

  it "renders a list of communications" do
    render
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Attachment".to_s, :count => 2
  end
end
