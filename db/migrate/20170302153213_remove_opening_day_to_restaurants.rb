class RemoveOpeningDayToRestaurants < ActiveRecord::Migration[5.0]
  def change
    remove_column :restaurants, :opening_day, :string
    add_column :restaurants, :opening_day, :integer
    add_column :restaurants, :closing_day, :integer
  end
end
