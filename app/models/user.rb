class User < ActiveRecord::Base
  ROLES=["Пользователь", "Администратор"]
  has_attached_file :avatar, styles: {medium: '300x300', thumb: '100x100'}
  validates_attachment :avatar, content_type: {content_type: ['image/jpg','image/jpeg','image/png','image/gif']}
  has_secure_password
  validates :login, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :password, length: {minimum: 6, allow_blank: true}
  validates :role, presence: true, inclusion: {in: 0...ROLES.size}

  scope :ordering,->{order(:login)}

  before_validation :set_default_role

  def set_default_role
    self.role||=0
  end

  def human_role
    ROLES[role]
  end

  def admin?
    role==1
  end

  def self.edit?(u)
    u && u.admin?
  end
end
