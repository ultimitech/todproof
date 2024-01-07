class CreateLookups < ActiveRecord::Migration[6.0]
  def change
    create_table :lookups do |t|
      t.integer :rsub
      t.integer :blk
      t.integer :sub
      t.references :translation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
