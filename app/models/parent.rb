class Parent < ApplicationRecord
    attribute :name
    attribute :surname
    attribute :email
    attribute :access_enabled, :boolean, default: false

    belongs_to :user
    has_and_belongs_to_many :students

    validates :name, :surname, presence: true, format: { with: /\A[a-zA-Z'-]*\z/, message: 'No special characters, only letters' }

    def to_s
        "#{name&.capitalize} #{surname&.capitalize}"
    end
end