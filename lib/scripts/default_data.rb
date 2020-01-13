class DefaultData

  def clean_db
    User.delete_all
    Teacher.delete_all
    Parent.delete_all
    Officer.delete_all
    Student.delete_all
    Lecture.delete_all
    SchoolClass.delete_all
    Attendance.delete_all
    Mark.delete_all
    Assignment.delete_all
    Communication.delete_all
    Administrator.delete_all
    Principal.delete_all
    Note.delete_all
    Timetable.delete_all
    true
  end

  def seed
    result = {}
    result[:users]          = users
    result[:teachers]       = teachers
    result[:parents]        = parents
    result[:officers]       = officers
    result[:school_classes] = school_classes
    result[:lectures]       = lectures
    result[:students]       = students
    result[:attendances]    = attendances
    result[:marks]          = marks
    result[:assignments]    = assignments
    result[:communications] = communications
    result[:administrators] = administrators
    result[:principals]     = principals
    result[:notes]          = notes
    result[:timetables]     = timetables
    result
  end

  def users
    result = []
    result << User.create(email: USER_1, password: 'user1pass', password_changed: true).id
    result << User.create(email: 'u2@p.it', password: 'user2pass').id
    result << User.create(email: 'u3@p.it', password: 'user3pass', password_changed: true).id
    result << User.create(email: 'u4@p.it', password: 'user4pass').id
    result << User.create(email: 'u5@p.it', password: 'user5pass').id
    result << User.create(email: 'u6@p.it', password: 'user6pass').id
    result << User.create(email: 'u7@p.it', password: 'user7pass', password_changed: true).id
    result << User.create(email: 'u8@p.it', password: 'user8pass', password_changed: true).id # admin
    result << User.create(email: 'u9@p.it', password: 'user9pass', password_changed: true).id # principal
    result << User.create(email: 'u10@p.it', password: 'user10pass', password_changed: true).id # principal
    result << User.create(email: 'u11@p.it', password: 'user11pass', password_changed: true).id # principal
    result.all?
  end

  def teachers
    result = []
    result << Teacher.create(name: 'Giuseppe', surname: 'Musso', subjects: %w(Math Geometry), user: User.find_by(email: USER_1)).id
    result << Teacher.create(name: 'Maria', surname: 'Cerrato', subjects: %w(Science Biology), user: User.find_by(email: 'u2@p.it')).id
    result << Teacher.create(name: 'Andrea', surname: 'Ferrero', subjects: %w(History Geography), user: User.find_by(email: 'u3@p.it')).id
    result << Teacher.create(name: 'Francesca', surname: 'Gallo', subjects: %w(English), user: User.find_by(email: 'u6@p.it')).id
    result << Teacher.create(name: 'Ivano', surname: 'Spagna', subjects: %w(Religion), user: User.find_by(email: 'u10@p.it')).id
    result << Teacher.create(name: 'Marinella', surname: 'Masini', subjects: %w(Gym), user: User.find_by(email: 'u11@p.it')).id
    result.all?
  end

  def parents
    result = []
    result << Parent.create(name: 'Giuseppe', surname: 'Musso', user: User.find_by(email: USER_1)).id
    result << Parent.create(name: 'Marco', surname: 'Viarengo', user: User.find_by(email: 'u4@p.it')).id
    result << Parent.create(name: 'Anna', surname: 'Bianchi', user: User.find_by(email: 'u5@p.it')).id
    result << Parent.create(name: 'Francesca', surname: 'Gallo', user: User.find_by(email: 'u6@p.it')).id
    result.all?
  end

  def officers
    result = []
    result << Officer.create(name: 'Antonio', surname: 'Rossi', user: User.find_by(email: 'u7@p.it')).id
    result.all?
  end

  def school_classes
    result = []
    result << SchoolClass.create(number: 1, section: 'A', teachers: Teacher.all).id
    result << SchoolClass.create(number: 1, section: 'B', teachers: Teacher.all).id
    result << SchoolClass.create(number: 2, section: 'A', teachers: Teacher.all).id
    result << SchoolClass.create(number: 2, section: 'B', teachers: Teacher.all).id
    result.all?
  end

  def lectures
    result = []
    result << Lecture.create(name: LECTURE_1, start_time: Time.now - 3.day, topics: SUM_OPERATION, subject: 'Math', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 1, section: 'A'), duration: 1).id
    result << Lecture.create(name: LECTURE_2, start_time: Time.now - 2.day, topics: 'Subtraction operation', subject: 'Math', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 1, section: 'A'), duration: 1).id
    result << Lecture.create(name: LECTURE_3, start_time: Time.now - 1.day, topics: 'Multiplication operation', subject: 'Math', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 1, section: 'A'), duration: 1).id
    result << Lecture.create(name: LECTURE_1, start_time: Time.now - 1.day, topics: 'Fractions', subject: 'Math', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A'), duration: 1).id
    result << Lecture.create(name: LECTURE_1, start_time: Time.now - 3.day, topics: 'Square', subject: 'Geometry', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A'), duration: 1).id
    result << Lecture.create(name: LECTURE_2, start_time: Time.now - 2.day, topics: 'Triangle', subject: 'Geometry', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 1, section: 'B'), duration: 1).id
    result << Lecture.create(name: LECTURE_3, start_time: Time.now - 1.day, topics: 'Circle', subject: 'Geometry', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 1, section: 'B'), duration: 1).id

    result << Lecture.create(name: LECTURE_1, start_time: Time.now - 3.day, topics: 'Atoms', subject: 'Science', teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), school_class: SchoolClass.find_by(number: 1, section: 'A'), duration: 1).id
    result << Lecture.create(name: LECTURE_2, start_time: Time.now - 2.day, topics: 'Light', subject: 'Science', teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), school_class: SchoolClass.find_by(number: 1, section: 'A'), duration: 1).id
    result << Lecture.create(name: LECTURE_3, start_time: Time.now - 1.day, topics: 'Molecules', subject: 'Science', teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), school_class: SchoolClass.find_by(number: 1, section: 'A'), duration: 1).id
    result << Lecture.create(name: LECTURE_1, start_time: Time.now - 3.day, topics: DIGESTIVE_SYSTEM, subject: 'Biology', teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), school_class: SchoolClass.find_by(number: 2, section: 'A'), duration: 1).id
    result << Lecture.create(name: LECTURE_2, start_time: Time.now - 2.day, topics: 'Respiratory system', subject: 'Biology', teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), school_class: SchoolClass.find_by(number: 2, section: 'A'), duration: 1).id
    result << Lecture.create(name: LECTURE_3, start_time: Time.now - 1.day, topics: 'Heart', subject: 'Biology', teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), school_class: SchoolClass.find_by(number: 2, section: 'A'), duration: 1).id

    result << Lecture.create(name: LECTURE_1, start_time: Time.now - 3.day, topics: 'Prehistory', subject: 'History', teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero'), school_class: SchoolClass.find_by(number: 1, section: 'B'), duration: 1).id
    result << Lecture.create(name: LECTURE_2, start_time: Time.now - 2.day, topics: 'Egyptian Empire', subject: 'History', teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero'), school_class: SchoolClass.find_by(number: 1, section: 'B'), duration: 1).id
    result << Lecture.create(name: LECTURE_3, start_time: Time.now - 1.day, topics: 'Roman Empire', subject: 'History', teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero'), school_class: SchoolClass.find_by(number: 1, section: 'B'), duration: 1).id
    result << Lecture.create(name: LECTURE_1, start_time: Time.now - 3.day, topics: 'Italy', subject: 'Geography', teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero'), school_class: SchoolClass.find_by(number: 1, section: 'B'), duration: 1).id
    result << Lecture.create(name: LECTURE_2, start_time: Time.now - 2.day, topics: 'France', subject: 'Geography', teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero'), school_class: SchoolClass.find_by(number: 1, section: 'B'), duration: 1).id
    result << Lecture.create(name: LECTURE_3, start_time: Time.now - 1.day, topics: 'Germany', subject: 'Geography', teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero'), school_class: SchoolClass.find_by(number: 1, section: 'B'), duration: 1).id
    result.all?
  end
  
  def students
    result = []
    result << Student.create(name: 'Roberto', surname: 'Musso', fiscal_code: 'MSSRRT00L20H501Q', birth_date: Date.new(2000, 8, 20), enrollment_date: Date.new(2019, 9, 1), parents: [Parent.find_by(name: 'Giuseppe', surname: 'Musso')], school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Student.create(name: 'Elena', surname: 'Musso', fiscal_code: 'MSSLNE01D46H501B', birth_date: Date.new(2001, 4, 6), enrollment_date: Date.new(2019, 9, 1), parents: [Parent.find_by(name: 'Giuseppe', surname: 'Musso')], school_class: SchoolClass.find_by(number: 1, section: 'A')).id
    result << Student.create(name: 'Luigi', surname: 'Gamba', fiscal_code: 'GMBLGU00B13H501C', birth_date: Date.new(2000, 2, 13), enrollment_date: Date.new(2019, 9, 1), parents: [Parent.find_by(name: 'Anna', surname: 'Bianchi')], school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Student.create(name: 'Stefano', surname: 'Gamba', fiscal_code: 'GMBSFN01E30H501C', birth_date: Date.new(2001, 5, 30), enrollment_date: Date.new(2019, 9, 1), parents: [Parent.find_by(name: 'Anna', surname: 'Bianchi')], school_class: SchoolClass.find_by(number: 1, section: 'A')).id
    result << Student.create(name: 'Chiara', surname: 'Saracco', fiscal_code: 'SRCCHR00S57H501V', birth_date: Date.new(2000, 11, 17), enrollment_date: Date.new(2019, 9, 1), parents: [Parent.find_by(name: 'Marco', surname: 'Viarengo')], school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Student.create(name: 'Angela', surname: 'Nebiolo', fiscal_code: 'RSSMSM01P03H501C', birth_date: Date.new(2001, 9, 3), enrollment_date: Date.new(2019, 9, 1), parents: [Parent.find_by(name: 'Francesca', surname: 'Gallo')], school_class: SchoolClass.find_by(number: 1, section: 'A')).id
    result.all?
  end

  def attendances
    result = []
    # Roberto Musso
    result << Attendance.create(date: Time.new(2019, 9, 13), absence_type: 'Late', enters_at: DateTime.new(2019, 9, 13, 10), student: Student.find_by(name: 'Roberto', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 9, 23), absence_type: 'Absent', student: Student.find_by(name: 'Roberto', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 9, 27), absence_type: 'Earl', exits_at: DateTime.new(2019, 9, 27, 13), student: Student.find_by(name: 'Roberto', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 10, 10), absence_type: 'Late', enters_at: DateTime.new(2019, 10, 10, 11), student: Student.find_by(name: 'Roberto', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 10, 18), absence_type: 'Earl', exits_at: DateTime.new(2019, 10, 18, 13), student: Student.find_by(name: 'Roberto', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 10, 24), absence_type: 'Absent', student: Student.find_by(name: 'Roberto', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 10, 25), absence_type: 'Absent', student: Student.find_by(name: 'Roberto', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 11, 8), absence_type: 'Earl', exits_at: DateTime.new(2019, 11, 8, 12), student: Student.find_by(name: 'Roberto', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 11, 18), absence_type: 'Late', enters_at: DateTime.new(2019, 11, 18, 9), student: Student.find_by(name: 'Roberto', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 11, 21), absence_type: 'Absent', student: Student.find_by(name: 'Roberto', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 12, 4), absence_type: 'Late', enters_at: DateTime.new(2019, 12, 4, 9), student: Student.find_by(name: 'Roberto', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 12, 4), absence_type: 'Earl', exits_at: DateTime.new(2019, 12, 4, 13), student: Student.find_by(name: 'Roberto', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 12, 9), absence_type: 'Absent', student: Student.find_by(name: 'Roberto', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id

    # Luigi Gamba
    result << Attendance.create(date: Time.new(2019, 10, 13), absence_type: 'Absent', student: Student.find_by(name: 'Luigi', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 10, 14), absence_type: 'Late', enters_at: DateTime.new(2019, 10, 14, 10), student: Student.find_by(name: 'Luigi', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 10, 29), absence_type: 'Earl', exits_at: DateTime.new(2019, 10, 29, 12), student: Student.find_by(name: 'Luigi', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 11, 19), absence_type: 'Absent', student: Student.find_by(name: 'Luigi', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 11, 20), absence_type: 'Absent', student: Student.find_by(name: 'Luigi', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 11, 21), absence_type: 'Absent', student: Student.find_by(name: 'Luigi', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 11, 22), absence_type: 'Absent', student: Student.find_by(name: 'Luigi', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 12, 12), absence_type: 'Late', enters_at: DateTime.new(2019, 12, 12, 9), student: Student.find_by(name: 'Luigi', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 12, 12), absence_type: 'Earl', exits_at: DateTime.new(2019, 12, 12, 13), student: Student.find_by(name: 'Luigi', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 2, section: 'A')).id

    # Stefano Gamba
    result << Attendance.create(date: Time.new(2019, 10, 28), absence_type: 'Absent', student: Student.find_by(name: 'Stefano', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 1, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 10, 29), absence_type: 'Absent', student: Student.find_by(name: 'Stefano', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 1, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 11, 12), absence_type: 'Late', enters_at: DateTime.new(2019, 11, 12, 9), student: Student.find_by(name: 'Stefano', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 1, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 11, 20), absence_type: 'Late', enters_at: DateTime.new(2019, 11, 20, 9), student: Student.find_by(name: 'Stefano', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 1, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 11, 25), absence_type: 'Late', enters_at: DateTime.new(2019, 11, 25, 9), student: Student.find_by(name: 'Stefano', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 1, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 11, 27), absence_type: 'Earl', exits_at: DateTime.new(2019, 11, 27, 12), student: Student.find_by(name: 'Stefano', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 1, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 12, 9), absence_type: 'Late', enters_at: DateTime.new(2019, 12, 9, 9), student: Student.find_by(name: 'Stefano', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 1, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 12, 9), absence_type: 'Earl', exits_at: DateTime.new(2019, 12, 9, 13), student: Student.find_by(name: 'Stefano', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 1, section: 'A')).id
    result << Attendance.create(date: Time.new(2019, 12, 16), absence_type: 'Absent', student: Student.find_by(name: 'Stefano', surname: 'Gamba'), school_class: SchoolClass.find_by(number: 1, section: 'A')).id

    # Chiara Saracco
    # Angela Nebiolo

    result.all?
  end

  def marks
    result = []
    # Roberto Musso
    result << Mark.create(mark: 10, subject: 'Math', date: Date.new(2019, 10, 24), notes: ORAL_EXAMINATION, student: Student.find_by(name: 'Roberto', surname: 'Musso'), teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso')).id
    result << Mark.create(mark: 8, subject: 'Geometry', date: Date.new(2019, 10, 22), notes: ORAL_EXAMINATION, student: Student.find_by(name: 'Roberto', surname: 'Musso'), teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso')).id
    result << Mark.create(mark: 7, subject: 'Science', date: Date.new(2019, 9, 21), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Roberto', surname: 'Musso'), teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato')).id
    result << Mark.create(mark: 8, subject: 'Science', date: Date.new(2019, 9, 10), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Roberto', surname: 'Musso'), teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato')).id
    result << Mark.create(mark: 7, subject: 'Biology', date: Date.new(2019, 9, 21), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Roberto', surname: 'Musso'), teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato')).id
    result << Mark.create(mark: 5.5, subject: 'History', date: Date.new(2019, 11, 21), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Roberto', surname: 'Musso'), teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero')).id
    result << Mark.create(mark: 6, subject: 'Geography', date: Date.new(2019, 11, 15), notes: ORAL_EXAMINATION, student: Student.find_by(name: 'Roberto', surname: 'Musso'), teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero')).id

    # Elena Musso
    result << Mark.create(mark: 8.5, subject: 'Math', date: Date.new(2019, 10, 23), notes: ORAL_EXAMINATION, student: Student.find_by(name: 'Elena', surname: 'Musso'), teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso')).id
    result << Mark.create(mark: 7, subject: 'Geometry', date: Date.new(2019, 10, 21), notes: ORAL_EXAMINATION, student: Student.find_by(name: 'Elena', surname: 'Musso'), teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso')).id
    result << Mark.create(mark: 7, subject: 'Science', date: Date.new(2019, 9, 21), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Elena', surname: 'Musso'), teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato')).id
    result << Mark.create(mark: 10, subject: 'Science', date: Date.new(2019, 9, 15), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Elena', surname: 'Musso'), teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato')).id
    result << Mark.create(mark: 7, subject: 'Biology', date: Date.new(2019, 9, 21), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Elena', surname: 'Musso'), teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato')).id
    result << Mark.create(mark: 9, subject: 'History', date: Date.new(2019, 11, 25), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Elena', surname: 'Musso'), teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero')).id
    result << Mark.create(mark: 4, subject: 'Geography', date: Date.new(2019, 11, 14), notes: ORAL_EXAMINATION, student: Student.find_by(name: 'Elena', surname: 'Musso'), teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero')).id

    # Luigi Gamba
    result << Mark.create(mark: 9, subject: 'Math', date: Date.new(2019, 10, 11), notes: ORAL_EXAMINATION, student: Student.find_by(name: 'Luigi', surname: 'Gamba'), teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso')).id
    result << Mark.create(mark: 9, subject: 'Geometry', date: Date.new(2019, 10, 12), notes: ORAL_EXAMINATION, student: Student.find_by(name: 'Luigi', surname: 'Gamba'), teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso')).id
    result << Mark.create(mark: 6, subject: 'Science', date: Date.new(2019, 9, 21), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Luigi', surname: 'Gamba'), teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato')).id
    result << Mark.create(mark: 6, subject: 'Science', date: Date.new(2019, 9, 10), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Luigi', surname: 'Gamba'), teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato')).id
    result << Mark.create(mark: 8, subject: 'Biology', date: Date.new(2019, 9, 21), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Luigi', surname: 'Gamba'), teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato')).id
    result << Mark.create(mark: 7, subject: 'History', date: Date.new(2019, 11, 21), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Luigi', surname: 'Gamba'), teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero')).id
    result << Mark.create(mark: 6, subject: 'Geography', date: Date.new(2019, 11, 15), notes: ORAL_EXAMINATION, student: Student.find_by(name: 'Luigi', surname: 'Gamba'), teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero')).id

    # Stefano Gamba
    result << Mark.create(mark: 10, subject: 'Math', date: Date.new(2019, 10, 15), notes: ORAL_EXAMINATION, student: Student.find_by(name: 'Stefano', surname: 'Gamba'), teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso')).id
    result << Mark.create(mark: 8, subject: 'Geometry', date: Date.new(2019, 10, 17), notes: ORAL_EXAMINATION, student: Student.find_by(name: 'Stefano', surname: 'Gamba'), teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso')).id
    result << Mark.create(mark: 6, subject: 'Science', date: Date.new(2019, 9, 21), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Stefano', surname: 'Gamba'), teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato')).id
    result << Mark.create(mark: 6.5, subject: 'Biology', date: Date.new(2019, 9, 15), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Stefano', surname: 'Gamba'), teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato')).id
    result << Mark.create(mark: 7, subject: 'Biology', date: Date.new(2019, 9, 25), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Stefano', surname: 'Gamba'), teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato')).id
    result << Mark.create(mark: 4, subject: 'Geography', date: Date.new(2019, 11, 7), notes: WRITTEN_EXAMINATION, student: Student.find_by(name: 'Stefano', surname: 'Gamba'), teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero')).id
    result << Mark.create(mark: 5, subject: 'Geography', date: Date.new(2019, 11, 20), notes: ORAL_EXAMINATION, student: Student.find_by(name: 'Stefano', surname: 'Gamba'), teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero')).id

    # Chiara Saracco
    # Angela Nebiolo

    result.all?
  end

  def assignments
    result = []

    result << Assignment.create(name: 'Math: ex. 1, 2, 3', expiry_date: Date.new(2019, 12, 24), subject: 'Math', description: 'Zanichelli: Pag 100, ex 1, 2, 3.', school_class: SchoolClass.find_by(number: 1, section: 'A'), teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), lecture: Lecture.find_by(name: LECTURE_1, topics: SUM_OPERATION, subject: 'Math', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 1, section: 'A'))).id
    result << Assignment.create(name: 'Math: ex. 4, 5, 6', expiry_date: Date.new(2019, 12, 23), subject: 'Math', description: 'Zanichelli: Pag 150, ex 4, 5, 6', school_class: SchoolClass.find_by(number: 1, section: 'A'), teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), lecture: Lecture.find_by(name: LECTURE_1, topics: SUM_OPERATION, subject: 'Math', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 1, section: 'A'))).id

    result << Assignment.create(name: 'Math: ex. 19, 20', expiry_date: Date.new(2019, 12, 24), subject: 'Math', description: 'Zanichelli II: Pag 100, ex 19, 20.', school_class: SchoolClass.find_by(number: 2, section: 'A'), teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), lecture: Lecture.find_by(name: LECTURE_1, topics: 'Fractions', subject: 'Math', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A'))).id
    result << Assignment.create(name: 'Math: ex. 21', expiry_date: Date.new(2019, 12, 23), subject: 'Math', description: 'Zanichelli II: Pag 100, ex 21.', school_class: SchoolClass.find_by(number: 2, section: 'A'), teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), lecture: Lecture.find_by(name: LECTURE_1, topics: 'Fractions', subject: 'Math', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A'))).id

    result << Assignment.create(name: 'Geometry: ex. 19, 20', expiry_date: Date.new(2019, 12, 21), subject: 'Geometry', description: 'Geomag II: Pag 100, ex 19, 20.', school_class: SchoolClass.find_by(number: 2, section: 'A'), teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), lecture: Lecture.find_by(name: LECTURE_1, topics: 'Square', subject: 'Geometry', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A'))).id
    result << Assignment.create(name: 'Geometry: ex. 21', expiry_date: Date.new(2019, 12, 20), subject: 'Geometry', description: 'Geomag II: Pag 100, ex 21.', school_class: SchoolClass.find_by(number: 2, section: 'A'), teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), lecture: Lecture.find_by(name: LECTURE_1, topics: 'Square', subject: 'Geometry', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 2, section: 'A'))).id

    result << Assignment.create(name: 'Biology: ex. 2', expiry_date: Date.new(2019, 12, 19), subject: 'Biology', description: 'BioBook: Pag 100, ex 2, please write down the entire procedure.', school_class: SchoolClass.find_by(number: 2, section: 'A'), teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), lecture: Lecture.find_by(name: LECTURE_1, topics: DIGESTIVE_SYSTEM, subject: 'Biology', teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), school_class: SchoolClass.find_by(number: 2, section: 'A'))).id
    result << Assignment.create(name: 'Biology: ex. 11', expiry_date: Date.new(2019, 12, 11), subject: 'Biology', description: 'BioBook: Pag 105, ex 11, please write down the entire procedure.', school_class: SchoolClass.find_by(number: 2, section: 'A'), teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), lecture: Lecture.find_by(name: LECTURE_1, topics: DIGESTIVE_SYSTEM, subject: 'Biology', teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), school_class: SchoolClass.find_by(number: 2, section: 'A'))).id

    result.all?
  end

  def communications
    result = []

    result << Communication.create(title: 'Erasmus', start_date: Date.new(2019, 10, 30), expiry_date: Date.new(2019, 12, 24), description: 'Candidates should apply.').id
    result << Communication.create(title: 'Christmas holidays', start_date: Date.new(2019, 11, 30), expiry_date: Date.new(2020, 1, 7), description: 'Holidays will be in those days specified in the attached file.').id

    result << Communication.create(title: 'Halloween holidays', start_date: Date.new(2019, 10, 20), expiry_date: Date.new(2019, 11, 2), description: 'On 31th October, 1st and 2nd November the school will be closed.').id
    result << Communication.create(title: 'Gym hours', start_date: Date.new(2019, 9, 30), expiry_date: Date.new(2019, 12, 1), description: 'Gym will remain closed until 1st December.').id

    result.all?
  end

  def administrators
    result = []
    result << Administrator.create(name: 'Marco', surname: 'Ghillardi', user: User.find_by(email: 'u8@p.it')).id
    result.all?
  end

  def principals
    result = []
    result << Principal.create(name: 'Giulia', surname: 'Principe', user: User.find_by(email: 'u9@p.it')).id
    result.all?
  end

  def notes
    result = []
    result << Note.create(subject: 'Math', description: 'The student did not do the assignments', date: Time.new(2020, 1, 7, 10, 30), teacher: Teacher.first, student: Student.first, school_class: SchoolClass.find_by(number: 2, section: 'A')).id
    result.all?
  end

  def timetables
    result = []
    subjects = ["Math", "Math", "Geometry", "Biology", "Geography", "English", "Science", "History", "Biology", "Geometry", "Geometry", "English", "Science", "English", "Gym", "Religion"]
    i = 0
    (1..5).each do |day|
      (1..6).each do |slot|
        @subject = subjects[i]
        @school_class = SchoolClass.find_by(number: 2, section: 'A')
        @teacher = Teacher.select{|t| t.school_classes.include?(@school_class) && t.subjects.include?(@subject)}.first
        result << Timetable.create(subject: @subject, day_of_week: day, slot_time: slot, school_class: @school_class, teacher: @teacher)
        i = (i + 1).modulo(subjects.length)
      end
    end
    result.all?
  end

end