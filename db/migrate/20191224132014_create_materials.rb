class CreateMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :materials do |t|
      t.string :title
      t.text :description
      t.string :file
      t.string :subject

      t.timestamps

      t.belongs_to :school_class
      t.belongs_to :teacher
    end
  end
end
