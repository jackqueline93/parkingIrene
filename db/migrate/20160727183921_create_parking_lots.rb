class CreateParkingLots < ActiveRecord::Migration
  def change
    create_table :parking_lots do |t|
      t.string  :name
      t.string  :description
      t.integer :price
      t.string  :opening_time
      t.string  :closing_time
      t.integer :user_id
      t.integer :district_id
      t.boolean :has_security_cameras
      t.boolean :has_security_alarms
      t.boolean :has_security_persons
      t.boolean :has_supermarkets_close
      t.boolean :has_restaurants_close
      t.boolean :has_cinemas_close

      t.timestamps null: false
    end
  end
end
