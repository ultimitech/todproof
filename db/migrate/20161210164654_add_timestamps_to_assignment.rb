class AddTimestampsToAssignment < ActiveRecord::Migration[6.0]
  def change
    add_column :assignments, :created_at, :datetime
    add_column :assignments, :updated_at, :datetime
    #change_column_null :assignments, :created_at, false
  end
end
