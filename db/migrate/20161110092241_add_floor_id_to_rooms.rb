class AddFloorIdToRooms < ActiveRecord::Migration
  def change
    add_reference :rooms, :floor, index: true, foreign_key: true
  end
end
