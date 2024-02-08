class CreatePeople < ActiveRecord::Migration[7.0]
  def change
    create_table :people do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :address
      t.integer :npa
      t.string :city
      t.string :email
      t.string :acronym
      t.string :stat
      t.timestamps
    end
  end
end
