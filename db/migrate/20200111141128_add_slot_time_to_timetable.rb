class AddSlotTimeToTimetable < ActiveRecord::Migration[6.0]
  def change
    add_column :timetables, :slot_time, :integer
  end
end
