class Restaurant < ApplicationRecord
  has_many :pizzas

  validates :name, uniqueness: true, presence:true
  validates :name, :address, presence:true
end
