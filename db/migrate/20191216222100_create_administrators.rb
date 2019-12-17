class CreateAdministrators < ActiveRecord::Migration[6.0]
  def change
    create_table :administrators do |t|
      t.string :name
      t.string :surname

      t.timestamps

      t.belongs_to :user
    end
  end
end
