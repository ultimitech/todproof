class AddLiToTranslations < ActiveRecord::Migration[6.0]
  def change
    add_column :translations, :li, :boolean
  end
end
