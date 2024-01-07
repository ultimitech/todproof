class FixParNameInTranslations < ActiveRecord::Migration[6.0]
  def change
    rename_column :translations, :parc, :subc
  end
end
