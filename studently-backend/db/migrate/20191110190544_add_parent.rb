class AddParent < ActiveRecord::Migration[6.0]
  def change
    create_table :parents do |t|
      t.string :name
      t.string :surname
      t.string :email

      t.timestamps
    end
  end
end
