require 'rails_helper'

RSpec.describe StaticPagesController, type: :controller do

  describe "GET #playground" do
    it "returns http success" do
      get :playground
      expect(response).to have_http_status(:success)
    end
  end

end
