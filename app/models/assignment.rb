class Assignment < ApplicationRecord
    belongs_to :school_class
    belongs_to :teacher
    belongs_to :lecture
end
