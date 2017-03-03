require 'rails_helper'

RSpec.describe "Pizzas", type: :request do
  describe "GET /pizzas" do
    let(:restaurant) {create :restaurant}
    it "works! (now write some real specs)" do
      get restaurant_pizzas_path(restaurant)
      expect(response).to have_http_status(200)
    end
  end
end
