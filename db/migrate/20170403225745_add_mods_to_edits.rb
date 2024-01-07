class AddModsToEdits < ActiveRecord::Migration[6.0]
  def change
    add_column :edits, :mods, :integer, :default => 0
  end
end
