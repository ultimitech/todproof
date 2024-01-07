class CreateMessages < ActiveRecord::Migration[6.0][6.0]
  def change
    create_table :messages do |t|
      t.date :dod
      t.string :tod
      t.string :dow
      t.string :title

      t.timestamps null: false
    end
  end
end
