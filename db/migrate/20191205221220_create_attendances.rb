class CreateAttendances < ActiveRecord::Migration[6.0]
  def change
    create_table :attendances do |t|
      t.date :date
      t.string :absence_type
      t.datetime :enters_at
      t.datetime :exits_at

      t.timestamps

      t.belongs_to :student
      t.belongs_to :school_class
    end
  end
end
