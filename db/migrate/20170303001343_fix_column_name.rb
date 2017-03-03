class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :restaurants, :openings_time, :opening_time
    rename_column :restaurants, :closings_time, :closing_time
  end
end
