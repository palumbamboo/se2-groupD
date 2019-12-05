class CreateAssignments < ActiveRecord::Migration[6.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.datetime :expiry_date
      t.string :file

      t.timestamps
    end
  end
end
