class CreateContributions < ActiveRecord::Migration[6.0]
  def change
    create_table :contributions do |t|
      t.string :type

      t.timestamps null: false
    end
  end
end
