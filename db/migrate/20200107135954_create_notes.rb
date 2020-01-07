class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.string :subject
      t.string :description
      t.datetime :date

      t.belongs_to :teacher
      t.belongs_to :student
      t.belongs_to :school_class

      t.timestamps
    end
  end
end
