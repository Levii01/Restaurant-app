require 'rails_helper'

RSpec.describe Restaurant do
  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { validate_uniqueness_of :name }
    it { is_expected.to validate_presence_of :address}

    context 'when create new restaurant' do
      subject { build :restaurant }
      it { is_expected.to be_valid }
    end

    context 'when restaurant with that name already exist' do
      let!(:restaurant) { create :restaurant, name: 'Magda Gessler pizza'}
      subject { build :restaurant , name: 'Magda Gessler pizza'}
      it { is_expected.to_not be_valid }
    end
    
    context 'when try to create empty restaurant' do
      let!(:restaurant) { create :restaurant }

      it { is_expected.to_not be_valid }
    end
  end

  describe 'database columns' do
    it { should have_db_column :name }
    it { should have_db_column :address }
    it { should have_db_column :opening_time }
    it { should have_db_column :closing_time }
    it { should have_db_column :opening_day }
    it { should have_db_column :closing_day }
    it { should have_db_column :created_at }
    it { should have_db_column :updated_at }
    it { is_expected.to have_db_index :name }
  end

  describe 'associations' do
    it { is_expected.to have_many :pizzas }
  end
end
