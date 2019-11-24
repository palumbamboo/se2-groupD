class Parent < ApplicationRecord
    attribute :name
    attribute :surname
    attribute :email

    belongs_to :user
    has_and_belongs_to_many :students
end