class User < ActiveRecord::Base
  ROLES=["Пользователь", "Администратор"]

  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: {with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i}
  validates :password, length: {minimum: 6, allow_blank: true}
  validates :role, presence: true, inclusion: {in: 0...ROLES.size}

  scope :ordering,->{order(:name)}

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
