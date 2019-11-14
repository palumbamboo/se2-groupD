class Student < ApplicationRecord
    attribute :name
    attribute :surname
    attribute :fiscal_code
    attribute :birth_date, type: Date
    attribute :enrollment_date, type: Date

    has_and_belongs_to_many :parents
    belongs_to :school_class
end