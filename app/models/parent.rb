class Parent < ApplicationRecord
    attribute :name
    attribute :surname
    attribute :email

    has_and_belongs_to_many :students
end