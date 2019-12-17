class SchoolClass < ApplicationRecord
  attribute :number
  attribute :section

  has_and_belongs_to_many :teachers, class_name: 'Teacher'
  has_many :students
  has_many :assignments

  def class_to_s
    "#{number}#{section.upcase}"
  end
  alias to_s class_to_s

  def self.available_classes
    SchoolClass.all - [SchoolClass.find_by(section: '0', number: 0)]
  end

  def attendances date=Time.now
    puts date
    absents = Attendance.where(school_class: self).where('date BETWEEN ? AND ?', date.beginning_of_day, date)
    attendances = (students.to_a - absents.map(&:student)).map{ |s|
      { student_id: s.id, student_name: s.to_s, attendance: true }
    }
    attendances.concat(absents.map(&:student).map{ |s|
      { student_id: s.id, student_name: s.to_s, attendance: false }
    })
    attendances
  end

end
