class Material < ApplicationRecord
  attribute :title
  attribute :description
  attribute :file
  attribute :subject

  belongs_to :school_class
  belongs_to :teacher

  mount_uploader :file, FileUploader

end
