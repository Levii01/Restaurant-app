class CreatePizzas < ActiveRecord::Migration[5.0]
  def change
    create_table :pizzas do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 3
      t.text :ingredients
      t.belongs_to :restaurant, foreign_key: true

      t.timestamps
    end
  end
end
