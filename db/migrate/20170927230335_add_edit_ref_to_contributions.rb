class AddEditRefToContributions < ActiveRecord::Migration[6.0]
  def change
    add_column :contributions, :base_edit_id, :integer 
  end
end
