class AddDescriptionToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :description, :string
  end
end
