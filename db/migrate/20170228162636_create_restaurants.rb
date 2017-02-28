class CreateRestaurants < ActiveRecord::Migration[5.0]
  def change
    create_table :restaurants do |t|
      t.string :name, unique: true, null: false, index: true
      t.string :address
      t.time :openings_time
      t.time :closings_time
      t.string :opening_day

      t.timestamps
    end
  end
end
