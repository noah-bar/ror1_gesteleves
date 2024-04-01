class AddRoleColumnToPeoples < ActiveRecord::Migration[7.0]
  def change
    add_column :people, :roles, :integer
  end
end
