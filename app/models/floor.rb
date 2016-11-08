class Floor < ActiveRecord::Base
  belongs_to :building
  validates :building_id, presence: true
  has_many :rooms, dependent: :destroy
  validates :image, presence: true
      has_attached_file :image, styles: {:medium => "100*100>"}
      validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
