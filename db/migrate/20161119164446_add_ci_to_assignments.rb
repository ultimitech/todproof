class AddCiToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :ci, :boolean
  end
end
