class AddPlaceToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :place, :integer
  end
end
