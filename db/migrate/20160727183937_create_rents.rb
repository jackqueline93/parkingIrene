class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.integer :user_id
      t.integer :parking_lot_id
      t.date :date
      t.integer :hours
      t.float :total_price

      t.timestamps null: false
    end
  end
end
