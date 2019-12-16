require 'rails_helper'

RSpec.describe "Principals", type: :request do
  describe "GET /principals" do
    it "works! (now write some real specs)" do
      get principals_path
      expect(response).to have_http_status(200)
    end
  end
end
