class AddTopToEdits < ActiveRecord::Migration[6.0]
  def change
    add_column :edits, :top, :string, limit: 1
  end
end
