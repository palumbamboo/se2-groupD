class Teacher < ApplicationRecord
  attribute :name
  attribute :surname
  attribute :subjects, :string, array: true, default: []

  belongs_to :user
  has_many :assignments

  has_and_belongs_to_many :school_classes, class_name: 'SchoolClass'
  has_many :lectures
  has_many :marks

  validates :name, :surname, presence: true, format: { with: /\A[a-zA-Z'-]*\z/, message: 'No special characters, only letters' }
  validate :valid_subjects

  def to_s
    "#{name&.capitalize} #{surname&.capitalize}"
  end

  def valid_subjects
    subjects.all?{ |s| s.in?(SUBJECTS) } && subjects.size > 0
  end
end
