class ChangeDescriptionToBeTextInAssigments < ActiveRecord::Migration[6.0]
  def change
    change_column :assignments, :description, :text
  end
end
