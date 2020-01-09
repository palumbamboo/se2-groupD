class Timetable < ApplicationRecord
  attribute :subject
  attribute :day_of_week, type: Integer
  attribute :start_time, type: Time
  attribute :end_time, type: Time

  belongs_to :school_class
  belongs_to :teacher

  validate :right_duration
  validates :subject, :day_of_week, :start_time, :end_time, :school_class, :teacher, presence: true

  def day_of_week= value
    raise ArgumentError, "Invalid value, use [1, 2, 3, 4, 5]" unless value.in?(1..5)

    super(value)
  end

  def right_duration
    errors.add(:end_time, 'End time must be greater than start_time') if start_time > end_time
  end
end
