class AddCloseoutFieldsToAssignment < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :status, :string
    add_column :assignments, :ccs, :integer
    add_column :assignments, :vcs, :integer
    add_column :assignments, :ct, :integer
    add_column :assignments, :vt, :integer
    add_column :assignments, :majtes, :integer
    add_column :assignments, :tietes, :integer
  end
end
