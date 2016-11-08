class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :user_name, presence: true, length: { minimum: 4, maximum: 16 } 
  has_many :buildings, dependent: :destroy 
validates_presence_of :email, :width => " /^(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-‌​Za-z0-9]+\++))*[A-Za‌​-z0-9]+@((\w+\-+)|(\‌​w+\.))*\w{1,63}\.[a-‌​zA-Z]{2,6}$/i "

  def admin?
    self.current_user.email== 'admin@example.com'
  end 
end
