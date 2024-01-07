class CreateEditUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :edit_users do |t|
      t.integer :edit_id
      t.integer :user_id
    end
  end
end
