class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable

  has_one :teacher
  has_one :parent

  def roles
    [:teacher, :parent].map{ |r| r if send(r) }.compact
  end

  def teacher?
    teacher.present?
  end

  def parent?
    parent.present?
  end
end
