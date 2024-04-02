class AddArchivedColumnToBranch < ActiveRecord::Migration[7.0]
  def change
    add_column :branches, :archived, :boolean, default: false
  end
end
