class RemoveEndTimeFromLecture < ActiveRecord::Migration[6.0]
  def change
    remove_column :lectures, :end_time
  end
end
