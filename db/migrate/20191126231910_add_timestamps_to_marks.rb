class AddTimestampsToMarks < ActiveRecord::Migration[6.0]
  def change
    add_column :marks, :created_at, :datetime, null: false
    add_column :marks, :updated_at, :datetime, null: false
  end
end
