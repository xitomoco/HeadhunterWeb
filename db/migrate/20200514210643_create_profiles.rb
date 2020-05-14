class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :social_name
      t.string :date_of_birth
      t.string :formations
      t.text :xp

      t.timestamps
    end
  end
end
