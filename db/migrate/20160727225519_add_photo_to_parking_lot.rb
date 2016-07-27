class AddPhotoToParkingLot < ActiveRecord::Migration
  def change
    add_attachment :parking_lots, :avatar
  end
end
