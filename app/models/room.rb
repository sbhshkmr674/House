class Room < ActiveRecord::Base
  belongs_to :floor
  validates :image, presence: true
  validates :building_id, presence: true
  validates :floor_id, presence: true
 validates :user_id, presence: true
  has_attached_file :image, styles: { :medium => "640x" }
      validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
