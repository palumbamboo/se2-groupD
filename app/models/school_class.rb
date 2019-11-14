class SchoolClass < ApplicationRecord
  attribute :number
  attribute :section

  has_and_belongs_to_many :teachers, class_name: 'Teacher'
  has_many :students

  def class_to_s
    "#{number}#{section.upcase}"
  end

end
