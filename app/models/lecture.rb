class Lecture < ApplicationRecord
  attribute :name
  attribute :start_time, type: DateTime
  attribute :end_time, type: DateTime
  attribute :topics
  attribute :subject
  attribute :duration, type: Integer

  belongs_to :teacher
  belongs_to :school_class
  has_many :assignments

  validates :name, :topics, presence: true, format: { with: /\A[\w[:punct:]\s]*\z/, message: 'No special characters, only letters and numbers' }
  validates :subject,       presence: true, inclusion: { in: SUBJECTS, message: 'Invalid subject' }
  validates :school_class_id, :teacher_id, presence: true

  def date
    start_time.to_date.strftime("%d/%m/%Y")
  end

  def to_s
    name
  end
end
