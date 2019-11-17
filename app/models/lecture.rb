class Lecture < ApplicationRecord
  attribute :name
  attribute :start_time, type: DateTime
  attribute :end_time, type: DateTime
  attribute :topics
  attribute :subject
  attribute :duration, type: Integer

  belongs_to :teacher
  belongs_to :school_class
end
