require 'rails_helper'

RSpec.describe PizzasHelper, type: :helper do
  describe "#price" do
    let(:pizza) { create :pizza, price: 43.253 }

    it "returns amount with two decimal places and currency" do
      expect(helper.price(pizza.price)).to eq("43,25 PLN")
    end
  end
end
