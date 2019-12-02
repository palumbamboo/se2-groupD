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

  def roles
    [:teacher, :parent, :officer].map{ |r| r if send(r) }.compact
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

  def password_changed?
    password_changed
  end
end
