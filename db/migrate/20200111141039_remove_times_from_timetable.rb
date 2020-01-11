class RemoveTimesFromTimetable < ActiveRecord::Migration[6.0]
  def change
    remove_column :timetables, :start_time, :time
    remove_column :timetables, :end_time, :time
  end
end
