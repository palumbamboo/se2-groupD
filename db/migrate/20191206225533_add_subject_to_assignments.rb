class AddSubjectToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :subject, :string
  end
end
