class ChangeEditsContentToString < ActiveRecord::Migration[6.0]
  def change
    change_column :edits, :content, :string
  end
end
