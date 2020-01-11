class Administrator < ApplicationRecord
  attribute :name
  attribute :surname

  belongs_to :user

  validates :name, :surname, presence: true, format: { with: /\A[a-zA-Z'-]*\z/, message: 'No special characters, only letters' }

  def to_s
    "#{name&.capitalize} #{surname&.capitalize}"
  end

end
