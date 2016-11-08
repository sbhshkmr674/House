class AddImageToFloors < ActiveRecord::Migration
  def change
    add_column :floors, :image, :string
  end
end
