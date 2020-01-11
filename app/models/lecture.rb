class Lecture < ApplicationRecord
  attribute :name
  attribute :start_time, type: DateTime
  attribute :topics
  attribute :subject
  attribute :duration, type: Integer

  belongs_to :teacher
  belongs_to :school_class
  has_many :assignments

  validates :name, :topics, presence: true, format: { with: /\A[\w[:punct:]\s]*\z/, message: 'No special characters, only letters and numbers' }
  validates :start_time, presence: true, inclusion: { in: START_OF_THE_YEAR..END_OF_THE_YEAR, message: "Lecture date must be in the current scholastic year #{ACADEMIC_YEAR}" }
  validates :subject, presence: true, inclusion: { in: SUBJECTS, message: 'Invalid subject' }
  validates :duration, presence: true, inclusion: { in: 1..6, message: 'Duration must be between 1 and 6 hours' }
  validates :school_class_id, :teacher_id, presence: true

  def date
    start_time.to_date.strftime("%d/%m/%Y")
  end

  def to_s
    name
  end

  def end_time
    start_time + duration.hours
  end
end
