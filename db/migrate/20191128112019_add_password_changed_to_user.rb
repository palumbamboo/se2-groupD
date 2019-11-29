class AddPasswordChangedToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :password_changed, :boolean, default: false
  end
end
