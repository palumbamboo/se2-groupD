class SchoolClass < ApplicationRecord
  attribute :number
  attribute :section

  has_and_belongs_to_many :teachers, class_name: 'Teacher'
  has_many :students
  has_many :assignments

  def class_to_s
    "#{number}#{section.upcase}"
  end

  def self.available_classes
    SchoolClass.all - [SchoolClass.find_by(section: '0', number: 0)]
  end

  def attendances date=Date.today
    absents = Attendance.where(school_class: self, date: date)
    attendances = (students.to_a - absents.map(&:student)).map{ |s|
      { student_id: s.id, student_name: s.to_s, attendance: true }
    }
    attendances.concat(absents.map(&:student).map{ |s|
      { student_id: s.id, student_name: s.to_s, attendance: false }
    })
    attendances
  end

end
