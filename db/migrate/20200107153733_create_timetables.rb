class CreateTimetables < ActiveRecord::Migration[6.0]
  def change
    create_table :timetables do |t|
      t.string :subject
      t.integer :day_of_week
      t.time :start_time
      t.time :end_time

      t.belongs_to :teacher
      t.belongs_to :school_class
      t.timestamps
    end
  end
end
