class AddFloorNameToFloor < ActiveRecord::Migration
  def change
    add_column :floors, :floor_name, :string
  end
end
