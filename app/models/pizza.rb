class Pizza < ApplicationRecord
  belongs_to :restaurant

  validates :name, :price, :ingredients, :restaurant_id, presence: true
  validates_numericality_of :price, greater_than_or_equal_to: 0, less_than: 100000
end
