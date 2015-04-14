class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :wikis

  mount_uploader :avatar, AvatarUploader

  after_initialize :init
  
  def init
    self.role ||= :standard
  end

  def admin?
      role == 'admin'
  end

  def standard?
    role == 'standard'
  end

  def premium?
    role == 'premium'
  end

end
