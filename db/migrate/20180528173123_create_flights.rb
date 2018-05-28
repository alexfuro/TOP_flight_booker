class CreateFlights < ActiveRecord::Migration[5.1]
  def change
    create_table :flights do |t|
      t.integer :departure_id
      t.integer :arrival_id
      t.datetime :departure_time
      t.time :duration

      t.timestamps
    end
    add_index :flights, :departure_id
    add_index :flights, :arrival_id
  end
end
