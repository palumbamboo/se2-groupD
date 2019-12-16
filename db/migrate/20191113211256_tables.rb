class Tables < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.inet     :current_sign_in_ip
      # t.inet     :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true

    add_column :users, :password_changed, :boolean, default: false

    create_table :teachers do |t|
      t.string :name
      t.string :surname

      t.belongs_to :user
    end

    add_column :teachers, :subjects, :string, array: true, default: []

    create_table :school_classes do |c|
      c.string :number
      c.string :section
    end

    create_table :lectures do |l|
      l.string :name
      l.datetime :start_time
      l.datetime :end_time
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

      p.belongs_to :user
    end

    add_column :parents, :access_enabled, :boolean, default: false

    create_table :students do |s|
      s.string :name
      s.string :surname
      s.string :fiscal_code
      s.date :birth_date
      s.date :enrollment_date

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

      m.timestamps

      m.belongs_to :student
      m.belongs_to :teacher
    end

    create_table :officers do |o|
      o.string :name
      o.string :surname

      o.belongs_to :user
    end

    create_table :attendances do |a|
      a.date :date
      a.string :absence_type
      a.datetime :enters_at
      a.datetime :exits_at

      a.timestamps

      a.belongs_to :student
      a.belongs_to :school_class
    end

    create_table :assignments do |a|
      a.string :name
      a.datetime :expiry_date
      a.string :file
      a.string :subject
      a.text :description

      a.timestamps

      a.belongs_to :school_class
      a.belongs_to :teacher
      a.belongs_to :lecture
    end

    create_table :communications do |c|
      c.string :title
      c.date :start_date
      c.date :expiry_date
      c.text :description
      c.string :attachment

      c.timestamps
    end
  end
end
