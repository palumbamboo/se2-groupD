class SchoolClass < ApplicationRecord
  attribute :number
  attribute :section

  has_and_belongs_to_many :teachers, class_name: 'Teacher'
  has_many :students

  def class_to_s
    "#{number}#{section.upcase}"
  end

  def self.available_classes
    SchoolClass.all - [SchoolClass.find_by(section: '0', number: 0)]
  end

end
