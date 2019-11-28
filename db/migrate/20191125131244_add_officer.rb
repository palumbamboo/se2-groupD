class AddOfficer < ActiveRecord::Migration[6.0]
  def change
    create_table :officers do |o|
      o.string :name
      o.string :surname

      o.belongs_to :user
    end
  end
end
