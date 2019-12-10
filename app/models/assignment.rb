class Assignment < ApplicationRecord
    attribute :name
    attribute :expiry_date, type: Time
    attribute :file
    attribute :subject
    attribute :description

    belongs_to :school_class
    belongs_to :teacher
    belongs_to :lecture

    def pretty_expiry_date
        expiry_date.to_date.strftime("%d/%m/%Y")
    end
end
