require 'rails_helper'

RSpec.describe "Communications", type: :request do
  describe "GET /communications" do
    it "works! (now write some real specs)" do
      get communications_path
      expect(response).to have_http_status(200)
    end
  end
end
