require 'rails_helper'

RSpec.describe Pizza do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :ingredients }
    it { is_expected.to validate_presence_of :restaurant_id }
    it { is_expected.to validate_numericality_of :price}

    describe "numericaly validation" do
      it do
        should validate_numericality_of(:price).
        is_less_than(100000)
      end

      it do
        should validate_numericality_of(:price).
        is_greater_than_or_equal_to(0)
      end
    end

    context 'when create new pizza' do
      let!(:pizza) { create :pizza }
      subject { build :pizza, pizza.attributes }

      it { is_expected.to be_valid }
    end

    context 'when try to create empty pizza' do
      let!(:pizza) { create :pizza }

      it { is_expected.to_not be_valid }
    end
  end

  describe 'database columns' do
    it { should have_db_column :name }
    it { should have_db_column :price }
    it { should have_db_column :ingredients }
    it { should have_db_column :restaurant_id }
    it { should have_db_column :created_at }
    it { should have_db_column :updated_at }
  end

  describe 'associations' do
    it { is_expected.to belong_to :restaurant }
  end
end
