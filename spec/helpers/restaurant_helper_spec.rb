require 'rails_helper'

RSpec.describe RestaurantsHelper, type: :helper do
  describe "#shortest_timme" do
    let(:restaurant) { create :restaurant, opening_time: '2017-02-03 9:00:02', closing_time: '2017-02-03 20:30:02'}

    it "return opening time in format hh:mm" do
      expect(helper.shortest_timme(restaurant.opening_time)).to eq("09:00")
    end

    it "return closing time in format hh:mm" do
      expect(helper.shortest_timme(restaurant.closing_time)).to eq("20:30")
    end
  end

  describe "#week_days" do
    it "returns array with week days" do
      expect(helper.week_days).to eql(%w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday))
    end

    it "returns last day of week " do
      expect(helper.week_days.last).to eql("Sunday")
    end
  end
end
