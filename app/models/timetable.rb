class Timetable < ApplicationRecord
  attribute :subject
  attribute :day_of_week, type: Integer
  attribute :slot_time, type: Integer

  belongs_to :school_class
  belongs_to :teacher

  validate :right_duration
  validates :subject, :day_of_week, :start_time, :end_time, :school_class, :teacher, presence: true

  def day_of_week= value
    raise ArgumentError, "Invalid value, use [1, 2, 3, 4, 5]" unless value.in?(1..5)

    super(value)
  end

  def slot_time= value
    raise ArgumentError, "Invalid value, use [1, 2, 3, 4, 5]" unless value.in?(1..5)

    super(value)
  end
end
