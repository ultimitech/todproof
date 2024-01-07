class CreateEdits < ActiveRecord::Migration[6.0]
  def change
    create_table :edits do |t|
      t.text :content
      t.boolean :hid

      t.timestamps null: false
    end
  end
end
