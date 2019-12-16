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

  def date
    start_time.to_date.strftime("%d/%m/%Y")
  end

  def to_s
    name
  end
end
