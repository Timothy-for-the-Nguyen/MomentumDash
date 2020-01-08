require 'rails_helper'

RSpec.describe "Progresstables", type: :request do
  describe "GET /progresstables" do
    it "works! (now write some real specs)" do
      get progresstables_path
      expect(response).to have_http_status(200)
    end
  end
end
