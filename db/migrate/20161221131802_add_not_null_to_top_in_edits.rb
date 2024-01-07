class AddNotNullToTopInEdits < ActiveRecord::Migration[6.0]
  def change
    change_column_null :edits, :top, false
  end
end
