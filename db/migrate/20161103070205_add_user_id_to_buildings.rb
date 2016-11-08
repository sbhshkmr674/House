class AddUserIdToBuildings < ActiveRecord::Migration
  def change
    add_reference :buildings, :user, index: true, foreign_key: true
  end
end
