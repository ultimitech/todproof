class AddBaseFieldsToAssignment < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :ccs_m, :integer
    add_column :assignments, :ccs_k, :integer
    add_column :assignments, :vcs_a, :integer
    add_column :assignments, :vcs_c, :integer
    add_column :assignments, :vcs_t, :integer
    add_column :assignments, :vcs_p, :integer
  end
end
