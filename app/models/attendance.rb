class Attendance < ApplicationRecord
  attribute :date, type: Date
  attribute :type
  attribute :enters_at, type: DateTime
  attribute :exits_at, type: DateTime

  belongs_to :student
  belongs_to :school_class
end
