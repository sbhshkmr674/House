class Building < ActiveRecord::Base
      validates :user_id, presence: true
      belongs_to :user
      has_many :floors, dependent: :destroy
	  validates :image, presence: true
      has_attached_file :image, styles: {:medium => "100*100>"}
      validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
