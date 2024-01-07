class RenameTranslationUserTable < ActiveRecord::Migration[6.0]
  def change
    rename_table(:translation_users, :assignments)
  end
end
