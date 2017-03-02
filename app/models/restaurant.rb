class Restaurant < ApplicationRecord
  DAYS = %w(Monday Tuesday Wednesday Thursday Friday Saturday Sunday)

  enum opening_day: DAYS, _prefix: :opens_at
  enum closing_day: DAYS, _prefix: :closes_at

  has_many :pizzas

  validates :name, uniqueness: true, presence:true
  validates :address, presence:true
end
