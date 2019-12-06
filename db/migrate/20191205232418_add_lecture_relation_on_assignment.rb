class AddLectureRelationOnAssignment < ActiveRecord::Migration[6.0]
  def change
    change_table :assignments do |a|
      a.column :lecture_id, :bigint
    end
  end
end
