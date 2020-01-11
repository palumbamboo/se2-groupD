class Note < ApplicationRecord
  attribute :date, type: DateTime
  attribute :description
  attribute :subject

  belongs_to :teacher
  belongs_to :student
  belongs_to :school_class

  validates :description, presence: true, format: { with: /\A[\w[:punct:]\s]*\z/, message: 'No special characters, only letters and numbers' }
  validates :date, presence: true, inclusion: { in: START_OF_THE_YEAR..END_OF_THE_YEAR, message: "Note date must be in the current scholastic year #{ACADEMIC_YEAR}" }
  validates :subject, presence: true, inclusion: { in: SUBJECTS, message: 'Invalid subject' }
  validates :teacher_id, :school_class_id, :student_id, presence: true
end
