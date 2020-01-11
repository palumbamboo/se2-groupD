class Assignment < ApplicationRecord
    attribute :name
    attribute :expiry_date, type: Time
    attribute :file
    attribute :subject
    attribute :description

    belongs_to :school_class
    belongs_to :teacher
    belongs_to :lecture

    validates :name,        presence: true, format: { with: /\A[\w[:punct:]\s]*\z/, message: 'No special characters, only letters and numbers' }
    validates :description, presence: true, format: { with: /\A[\w\s[:punct:]]*\z/, message: 'No special characters, only letters, numbers and punctuation' }
    validates :expiry_date, presence: true, inclusion: { in: START_OF_THE_YEAR..END_OF_THE_YEAR, message: "Expiration date must be in the current scholastic year #{ACADEMIC_YEAR}"}
    validates :subject,     presence: true, inclusion: { in: SUBJECTS, message: 'Invalid subject' }
    validates :school_class_id, :teacher_id, :lecture_id, presence: true

    mount_uploader :file, FileUploader

    def pretty_expiry_date
        expiry_date.to_date.strftime("%d/%m/%Y")
    end
end
