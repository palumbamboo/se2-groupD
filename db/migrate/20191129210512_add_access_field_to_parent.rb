class AddAccessFieldToParent < ActiveRecord::Migration[6.0]
  def change
    add_column :parents, :access_enabled, :boolean, default: false
  end
end
