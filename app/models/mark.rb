class Mark < ApplicationRecord
  attribute :mark, type: Float
  attribute :subject
  attribute :date, type: Date
  attribute :notes

  belongs_to :student
  belongs_to :teacher

  validates :mark, presence: true, inclusion: { in: 0..10, message: 'Mark value must be between 0 and 10' }
  validates :subject, presence: true, inclusion: { in: SUBJECTS, message: 'Invalid subject' }
  validates :date, presence: true, inclusion: { in: START_OF_THE_YEAR..END_OF_THE_YEAR, message: "Mark date must be in the current scholastic year #{ACADEMIC_YEAR}" }
  validates :notes, presence: true, format: { with: /\A[\w[:punct:]\s]*\z/, message: 'No special characters, only letters and numbers' }
  validates :student_id, :teacher_id, presence: true
end