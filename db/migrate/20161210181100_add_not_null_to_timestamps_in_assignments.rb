class AddNotNullToTimestampsInAssignments < ActiveRecord::Migration[6.0]
  def change
    change_column_null :assignments, :created_at, false
    change_column_null :assignments, :updated_at, false
  end
end
