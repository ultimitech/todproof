class AddRoleToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :role, :string
  end
end
