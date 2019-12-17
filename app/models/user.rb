class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable

  has_one :teacher
  has_one :parent
  has_one :officer
  has_one :administrator
  has_one :principal


  def roles
    [:teacher, :parent, :officer, :administrator, :principal].map{ |r| r if send(r) }.compact
  end

  def teacher?
    teacher.present?
  end

  def parent?
    parent.present?
  end

  def officer?
    officer.present?
  end

  def administrator?
    administrator.present?
  end

  def principal?
    principal.present?
  end

  def password_changed?
    password_changed
  end

  def self.initialize_user email
    User.new(email: email, password: Devise.friendly_token(20))
  end

  def name
    role = roles.first
    send(role).name if role
  end

  def surname
    role = roles.first
    send(role).surname if role
  end
end
