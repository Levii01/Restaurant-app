class Restaurant < ApplicationRecord
  validates :name, uniqueness: true, presence:true
end
