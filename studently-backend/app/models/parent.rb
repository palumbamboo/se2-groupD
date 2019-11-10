class Parent < ApplicationRecord
    has_and_belongs_to_many :students ##N-N relation
end