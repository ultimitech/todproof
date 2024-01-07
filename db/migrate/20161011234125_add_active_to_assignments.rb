class AddActiveToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :active, :boolean
  end
end
