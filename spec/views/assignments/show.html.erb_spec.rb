require 'rails_helper'

RSpec.describe "assignments/show", type: :view do
  before(:each) do
    @assignment = assign(:assignment, Assignment.create!(
      :name => "Name",
      :file => "File"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/File/)
  end
end
