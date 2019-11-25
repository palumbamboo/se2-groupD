class Teacher < ApplicationRecord
  attribute :name
  attribute :surname
  attribute :subjects, :string, array: true, default: []

  belongs_to :user

  has_and_belongs_to_many :school_classes, class_name: 'SchoolClass'
  has_many :lectures
  has_many :marks

  def to_s
    "#{name&.capitalize} #{surname&.capitalize}"
  end
end
