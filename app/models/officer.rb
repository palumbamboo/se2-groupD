class Officer < ApplicationRecord
  attribute :name
  attribute :surname

  belongs_to :user

  def to_s
    "#{name&.capitalize} #{surname&.capitalize}"
  end
end
