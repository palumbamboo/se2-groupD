class ChangeAttendanceDate < ActiveRecord::Migration[6.0]
  def change
    change_column :attendances, :date, :datetime
  end
end
