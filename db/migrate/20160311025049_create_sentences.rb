class CreateSentences < ActiveRecord::Migration[6.0]
  def change
    create_table :sentences do |t|
      t.integer :blk
      t.integer :par
      t.integer :sen
      t.string :typ
      t.boolean :tie
      t.references :translation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
