class AddPubdateToTranslations < ActiveRecord::Migration[6.0]
  def change
    add_column :translations, :pubdate, :date
  end
end
