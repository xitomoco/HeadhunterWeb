class ChangeDateOfBirthFromProfile < ActiveRecord::Migration[6.0]
  def change
    change_column :profiles, :date_of_birth, :date
  end
end
