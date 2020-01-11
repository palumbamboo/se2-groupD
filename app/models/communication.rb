class Communication < ApplicationRecord
  attribute :title
  attribute :start_date, type: Date
  attribute :expiry_date, type: Date
  attribute :description
  attribute :attachment

  validates :title, :description, format: { with: /\A[\w[:punct:]\s]*\z/, message: 'No special characters, only letters and numbers' }
  validates :start_date, :expiry_date, inclusion: { in: START_OF_THE_YEAR..END_OF_THE_YEAR, message: "Communication date must be in the current scholastic year #{ACADEMIC_YEAR}"}

  mount_uploader :attachment, FileUploader

end
