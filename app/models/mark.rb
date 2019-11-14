class Mark < ApplicationRecord
  attribute :mark, type: Float
  attribute :subject
  attribute :date, type: Date
  attribute :notes

  belongs_to :student
  belongs_to :teacher
end