class CreateTranslationUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :translation_users do |t|
      t.integer :translation_id
      t.integer :user_id
    end
  end
end
