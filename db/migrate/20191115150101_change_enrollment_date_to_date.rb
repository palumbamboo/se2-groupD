class ChangeEnrollmentDateToDate < ActiveRecord::Migration[6.0]
  def change
    change_column :students, :enrollment_date, 'date USING CAST(enrollment_date AS date)'
    change_column :lectures, :start_time, :datetime
    change_column :lectures, :end_time, :datetime
  end
end
