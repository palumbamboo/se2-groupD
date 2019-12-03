class DefaultData

  def clean_db
    User.delete_all
    Teacher.delete_all
    Parent.delete_all
    Officer.delete_all
    Student.delete_all
    Lecture.delete_all
    SchoolClass.delete_all
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
    result
  end

  def users
    result = []
    result << User.create(email: 'u1@p.it', password: 'user1pass')
    result << User.create(email: 'u2@p.it', password: 'user2pass')
    result << User.create(email: 'u3@p.it', password: 'user3pass', password_changed: true)
    result << User.create(email: 'u4@p.it', password: 'user4pass')
    result << User.create(email: 'u5@p.it', password: 'user5pass')
    result << User.create(email: 'u6@p.it', password: 'user6pass')
    result << User.create(email: 'u7@p.it', password: 'user7pass', password_changed: true)
    result.all?
  end

  def teachers
    result = []
    result << Teacher.create(name: 'Giuseppe', surname: 'Musso', subjects: %w(Maths Geometry), user: User.find_by(email: 'u1@p.it'))
    result << Teacher.create(name: 'Maria', surname: 'Cerrato', subjects: %w(Science Biology), user: User.find_by(email: 'u2@p.it'))
    result << Teacher.create(name: 'Andrea', surname: 'Ferrero', subjects: %w(History Geography), user: User.find_by(email: 'u3@p.it'))
    result.all?
  end

  def parents
    result = []
    result << Parent.create(name: 'Giuseppe', surname: 'Musso', user: User.find_by(email: 'u1@p.it'))
    result << Parent.create(name: 'Marco', surname: 'Viarengo', user: User.find_by(email: 'u4@p.it'))
    result << Parent.create(name: 'Anna', surname: 'Bianchi', user: User.find_by(email: 'u5@p.it'))
    result << Parent.create(name: 'Francesca', surname: 'Gallo', user: User.find_by(email: 'u6@p.it'))
    result.all?
  end

  def officers
    result = []
    result << Officer.create(name: 'Antonio', surname: 'Rossi', user: User.find_by(email: 'u7@p.it'))
    result.all?
  end

  def school_classes
    result = []
    result << SchoolClass.create(number: 1, section: 'A', teachers: Teacher.all)
    result << SchoolClass.create(number: 1, section: 'B', teachers: Teacher.all)
    result << SchoolClass.create(number: 2, section: 'A', teachers: Teacher.all)
    result << SchoolClass.create(number: 2, section: 'B', teachers: Teacher.all)
    result.all?
  end

  def lectures
    result = []
    result << Lecture.create(name: 'Lecture 1', start_time: Time.now - 3.day, topics: 'Sum operation', subject: 'Math', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 1, section: 'A'))
    result << Lecture.create(name: 'Lecture 2', start_time: Time.now - 2.day, topics: 'Subtraction operation', subject: 'Math', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 1, section: 'A'))
    result << Lecture.create(name: 'Lecture 3', start_time: Time.now - 1.day, topics: 'Multiplication operation', subject: 'Math', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 1, section: 'A'))
    result << Lecture.create(name: 'Lecture 1', start_time: Time.now - 3.day, topics: 'Square', subject: 'Geometry', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 1, section: 'B'))
    result << Lecture.create(name: 'Lecture 2', start_time: Time.now - 2.day, topics: 'Triangle', subject: 'Geometry', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 1, section: 'B'))
    result << Lecture.create(name: 'Lecture 3', start_time: Time.now - 1.day, topics: 'Circle', subject: 'Geometry', teacher: Teacher.find_by(name: 'Giuseppe', surname: 'Musso'), school_class: SchoolClass.find_by(number: 1, section: 'B'))

    result << Lecture.create(name: 'Lecture 1', start_time: Time.now - 3.day, topics: 'Atoms', subject: 'Science', teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), school_class: SchoolClass.find_by(number: 1, section: 'A'))
    result << Lecture.create(name: 'Lecture 2', start_time: Time.now - 2.day, topics: 'Light', subject: 'Science', teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), school_class: SchoolClass.find_by(number: 1, section: 'A'))
    result << Lecture.create(name: 'Lecture 3', start_time: Time.now - 1.day, topics: 'Molecules', subject: 'Science', teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), school_class: SchoolClass.find_by(number: 1, section: 'A'))
    result << Lecture.create(name: 'Lecture 1', start_time: Time.now - 3.day, topics: 'Digestive system', subject: 'Biology', teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), school_class: SchoolClass.find_by(number: 2, section: 'A'))
    result << Lecture.create(name: 'Lecture 2', start_time: Time.now - 2.day, topics: 'Respiratory system', subject: 'Biology', teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), school_class: SchoolClass.find_by(number: 2, section: 'A'))
    result << Lecture.create(name: 'Lecture 3', start_time: Time.now - 1.day, topics: 'Heart', subject: 'Biology', teacher: Teacher.find_by(name: 'Maria', surname: 'Cerrato'), school_class: SchoolClass.find_by(number: 2, section: 'A'))

    result << Lecture.create(name: 'Lecture 1', start_time: Time.now - 3.day, topics: 'Prehistory', subject: 'History', teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero'), school_class: SchoolClass.find_by(number: 1, section: 'B'))
    result << Lecture.create(name: 'Lecture 2', start_time: Time.now - 2.day, topics: 'Egyptian Empire', subject: 'History', teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero'), school_class: SchoolClass.find_by(number: 1, section: 'B'))
    result << Lecture.create(name: 'Lecture 3', start_time: Time.now - 1.day, topics: 'Roman Empire', subject: 'History', teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero'), school_class: SchoolClass.find_by(number: 1, section: 'B'))
    result << Lecture.create(name: 'Lecture 1', start_time: Time.now - 3.day, topics: 'Italy', subject: 'Geography', teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero'), school_class: SchoolClass.find_by(number: 1, section: 'B'))
    result << Lecture.create(name: 'Lecture 2', start_time: Time.now - 2.day, topics: 'France', subject: 'Geography', teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero'), school_class: SchoolClass.find_by(number: 1, section: 'B'))
    result << Lecture.create(name: 'Lecture 3', start_time: Time.now - 1.day, topics: 'Germany', subject: 'Geography', teacher: Teacher.find_by(name: 'Andrea', surname: 'Ferrero'), school_class: SchoolClass.find_by(number: 1, section: 'B'))
    result.all?
  end
  
  def students
    result = []
    result << Student.create(name: 'Roberto', surname: 'Musso', fiscal_code: 'MSSRRT00L20H501Q', birth_date: Date.new(2000, 8, 20), enrollment_date: Date.new(2019, 9, 1), parents: [Parent.find_by(name: 'Giuseppe', surname: 'Musso')], school_class: SchoolClass.find_by(number: 2, section: 'A'))
    result << Student.create(name: 'Elena', surname: 'Musso', fiscal_code: 'MSSLNE01D46H501B', birth_date: Date.new(2001, 4, 6), enrollment_date: Date.new(2019, 9, 1), parents: [Parent.find_by(name: 'Giuseppe', surname: 'Musso')], school_class: SchoolClass.find_by(number: 1, section: 'A'))
    result << Student.create(name: 'Luigi', surname: 'Gamba', fiscal_code: 'GMBLGU00B13H501C', birth_date: Date.new(2000, 2, 13), enrollment_date: Date.new(2019, 9, 1), parents: [Parent.find_by(name: 'Anna', surname: 'Bianchi')], school_class: SchoolClass.find_by(number: 2, section: 'A'))
    result << Student.create(name: 'Stefano', surname: 'Gamba', fiscal_code: 'GMBSFN01E30H501C', birth_date: Date.new(2001, 5, 30), enrollment_date: Date.new(2019, 9, 1), parents: [Parent.find_by(name: 'Anna', surname: 'Bianchi')], school_class: SchoolClass.find_by(number: 1, section: 'A'))
    result << Student.create(name: 'Chiara', surname: 'Saracco', fiscal_code: 'SRCCHR00S57H501V', birth_date: Date.new(2000, 11, 17), enrollment_date: Date.new(2019, 9, 1), parents: [Parent.find_by(name: 'Marco', surname: 'Viarengo')], school_class: SchoolClass.find_by(number: 2, section: 'A'))
    result << Student.create(name: 'Angela', surname: 'Nebiolo', fiscal_code: 'RSSMSM01P03H501C', birth_date: Date.new(2001, 9, 3), enrollment_date: Date.new(2019, 9, 1), parents: [Parent.find_by(name: 'Francesca', surname: 'Gallo')], school_class: SchoolClass.find_by(number: 1, section: 'A'))
    result.all?
  end
end