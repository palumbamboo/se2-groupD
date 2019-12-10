require 'rails_helper'

RSpec.describe "communications/show", type: :view do
  before(:each) do
    @communication = assign(:communication, Communication.create!(
      :title => "Title",
      :description => "MyText",
      :attachment => "Attachment"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Attachment/)
  end
end
