class CreateTranslations < ActiveRecord::Migration[6.0]
  def change
    create_table :translations do |t|
      t.string :lan
      t.string :tran_title
      t.string :descrip
      t.integer :blkc
      t.integer :parc
      t.integer :senc
      t.string :xcrip
      t.references :message, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
