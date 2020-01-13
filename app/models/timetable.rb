class Timetable < ApplicationRecord
  attribute :subject
  attribute :day_of_week, type: Integer
  attribute :slot_time, type: Integer

  belongs_to :school_class
  belongs_to :teacher

  validates :subject, :day_of_week, :slot_time, :school_class, :teacher, presence: true
  validates_inclusion_of :day_of_week, :in => 1..5, :message => "Invalid value, use [1, 2, 3, 4, 5]"
  validates_inclusion_of :slot_time, :in => 1..6, :message => "Invalid value, use [1, 2, 3, 4, 5, 6]"

  # def day_of_week= value
  #   raise ArgumentError, "Invalid value, use [1, 2, 3, 4, 5]" unless value.in?(1..5)
  #   super(value)
  # end

  # def slot_time= value
  #   raise ArgumentError, "Invalid value, use [1, 2, 3, 4, 5, 6]" unless value.in?(1..6)

  #   super(value)
  # end
end
