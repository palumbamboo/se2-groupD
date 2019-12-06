class AddForeignKeysToAssignment < ActiveRecord::Migration[6.0]
  def change
    change_table :assignments do |a|
      a.column :school_class_id, :bigint
      a.column :teacher_id, :bigint
    end
  end
end
