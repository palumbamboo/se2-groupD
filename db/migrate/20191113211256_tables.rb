class Tables < ActiveRecord::Migration[6.0]
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :surname
      t.text :subjects, :string, Array
    end

    create_table :school_classes do |c|
      c.string :number
      c.string :section
    end

    create_table :lectures do |l|
      l.string :name
      l.date :start_time
      l.date :end_time
      l.string :topics
      l.string :subject
      l.integer :duration

      l.belongs_to :teacher
      l.belongs_to :school_class
    end

    create_join_table :teachers, :school_classes do |t|
      t.index :teacher_id
      t.index :school_class_id
    end

    create_table :parents do |p|
      p.string :name
      p.string :surname
      p.string :email
    end

    create_table :students do |s|
      s.string :name
      s.string :surname
      s.string :fiscal_code
      s.date :birth_date
      s.string :enrollment_date

      s.belongs_to :school_class
    end

    create_join_table :students, :parents do |t|
      t.index :student_id
      t.index :parent_id
    end

    create_table :marks do |m|
      m.float :mark
      m.string :subject
      m.date :date
      m.string :notes

      m.belongs_to :student
      m.belongs_to :teacher
    end
  end
end
