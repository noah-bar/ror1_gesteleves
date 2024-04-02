class AddPasswordColumnToPeoples < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :password_digest, :string
  end
end
