class User < ApplicationRecord
  mount_uploader :image, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

 

  has_many :room_messages,
           dependent: :destroy

  def gravatar_url
    # gravatar_id = Digest::MD5::hexdigest(email).downcase
    # "https://gravatar.com/avatar/#{gravatar_id}.png"
    self.image.url rescue nil
  end
end
