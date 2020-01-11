class Material < ApplicationRecord
  attribute :title
  attribute :description
  attribute :file
  attribute :subject

  belongs_to :school_class
  belongs_to :teacher

  validates :title, :description, presence: true, format: { with: /\A[\w[:punct:]\s]*\z/, message: 'No special characters, only letters and numbers' }
  validates :subject, presence: true, inclusion: { in: SUBJECTS, message: 'Invalid subject' }
  validates :teacher_id, :school_class_id, presence: true

  mount_uploader :file, FileUploader

end
