class CreatePassengers < ActiveRecord::Migration[5.1]
  def change
    create_table :passengers do |t|
      t.string :name
      t.string :email
      t.integer :booking_id

      t.timestamps
    end
    add_index :passengers, :email
    add_index :passengers, :booking_id
  end
end
