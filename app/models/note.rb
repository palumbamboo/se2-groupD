class Note < ApplicationRecord
  attribute :date, type: DateTime
  attribute :description
  attribute :subject

  belongs_to :teacher
  belongs_to :student
  belongs_to :school_class
end
