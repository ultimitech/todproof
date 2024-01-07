class AddNotesToAssignments < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :notes, :string
  end
end
