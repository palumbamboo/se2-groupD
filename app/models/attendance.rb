class Attendance < ApplicationRecord
  attribute :date, type: Date
  attribute :absence_type
  attribute :enters_at, type: DateTime
  attribute :exits_at, type: DateTime

  belongs_to :student
  belongs_to :school_class

  # absence_type should be one of {"Absent", "Late", "Earl"} -> TODO: force input data to be like this
  # TODO: check constraint that if type=absent, enters_at and exits_at fields are null
end
