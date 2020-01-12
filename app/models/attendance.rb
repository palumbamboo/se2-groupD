class Attendance < ApplicationRecord
  attr_accessor :type

  attribute :date, type: Date
  attribute :absence_type
  attribute :enters_at, type: DateTime
  attribute :exits_at, type: DateTime

  belongs_to :student
  belongs_to :school_class

  validates :date, presence: true, inclusion: { in: START_OF_THE_YEAR..END_OF_THE_YEAR, message: "Attendance date must be in the current scholastic year #{ACADEMIC_YEAR}"}
  validates :absence_type, presence: true, inclusion: { in: ABSENCE_TYPES }
  validates :student_id, :school_class_id, presence: true

  def formatted_date
    date.to_date.strftime("%Y-%m-%d")
  end

  def formatted_enters_at
    enters_at.strftime("%H:%M:%S")
  end

  def formatted_exits_at
    exits_at.strftime("%H:%M:%S")
  end

  # absence_type should be one of {"Absent", "Late", "Earl"} -> force input data to be like this
  # check constraint that if type=absent, enters_at and exits_at fields are null
end
