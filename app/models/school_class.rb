class SchoolClass < ApplicationRecord
  attribute :number
  attribute :section

  has_and_belongs_to_many :teachers, class_name: 'Teacher'
  has_many :students
  has_many :assignments

  validates :number, presence: true, format: { with: /\A[1-9]\z/, message: 'Invalid school class number' }
  validates :section, presence: true, format: { with: /\A[A-Z]\z/, message: 'Invalid school class section' }

  def class_to_s
    "#{number}#{section.upcase}"
  end
  alias to_s class_to_s

  def self.available_classes
    SchoolClass.all - [SchoolClass.find_by(section: '0', number: 0)]
  end

  def attendances date=Time.now
    puts date
    query = 'date BETWEEN ? AND ?'
    absents = Attendance.where(school_class: self).where(query, date.beginning_of_day, Time.now.gmtime).where(absence_type: "Absent")
    late = Attendance.where(school_class: self).where(query, date.beginning_of_day, Time.now.gmtime).where('enters_at BETWEEN ? AND ?', date.beginning_of_day, Time.now.gmtime).where(absence_type: "Late")
    early = Attendance.where(school_class: self).where(query, date.beginning_of_day, Time.now.gmtime).where('exits_at BETWEEN ? AND ?', date.beginning_of_day, Time.now.gmtime).where(absence_type: "Earl")

    attendances = absents.map(&:student).map{ |a|
      { student_id: a.id, student_name: a.to_s, attendance: false }
    }

    attendances.concat early.map(&:student).map{ |e|
      { student_id: e.id, student_name: e.to_s, attendance: false }
    }

    attendances.concat late.map(&:student).map{ |l|
      { student_id: l.id, student_name: l.to_s, attendance: true }
    }

    attendances.concat (students.to_a - absents.map(&:student) - early.map(&:student) - late.map(&:student)).map{ |s|
      { student_id: s.id, student_name: s.to_s, attendance: true }
    }

    attendances
  end

end
