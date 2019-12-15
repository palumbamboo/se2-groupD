class Communication < ApplicationRecord
  attribute :title
  attribute :start_date, type: Date
  attribute :expiry_date, type: Date
  attribute :description
  attribute :attachment
end
