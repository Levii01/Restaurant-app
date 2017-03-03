require 'rails_helper'

RSpec.describe RestaurantsHelper, type: :helper do
  describe "#shortest_timme" do
    let(:restaurant) { create :restaurant, opening_time: '2017-02-03 9:00:02', closing_time: '2017-02-03 20:30:02'}
    let(:second_restaurant) { create :restaurant, opening_time: nil, closing_time: '2017-02-03 20:30:02'}
    context "when time in record exist" do
      it "return opening time in format hh:mm" do
        expect(helper.shortest_timme(restaurant.opening_time)).to eq("09:00")
      end

      it "return closing time in format hh:mm" do
        expect(helper.shortest_timme(restaurant.closing_time)).to eq("20:30")
      end
    end

    context "when one of record with time is nill" do
      it 'first object return nill' do
        expect(helper.shortest_timme(second_restaurant.opening_time)).to be_nil
      end

      it 'second object return time' do
        expect(helper.shortest_timme(second_restaurant.closing_time)).to eq("20:30")
      end
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
