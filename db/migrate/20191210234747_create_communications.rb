class CreateCommunications < ActiveRecord::Migration[6.0]
  def change
    create_table :communications do |t|
      t.string :title
      t.date :start_date
      t.date :expiry_date
      t.text :description
      t.string :attachment

      t.timestamps
    end
  end
end
