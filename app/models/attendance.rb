class Attendance < ApplicationRecord
  attr_accessor :type

  attribute :date, type: DateTime
  attribute :absence_type
  attribute :enters_at, type: DateTime
  attribute :exits_at, type: DateTime

  belongs_to :student
  belongs_to :school_class

  def formatted_date
    date.to_date.strftime("%Y-%m-%d")
  end

  def formatted_enters_at
    enters_at.strftime("%H:%M:%S")
  end

  def formatted_exits_at
    exits_at.strftime("%H:%M:%S")
  end

  # absence_type should be one of {"Absent", "Late", "Earl"} -> TODO: force input data to be like this
  # TODO: check constraint that if type=absent, enters_at and exits_at fields are null
end
