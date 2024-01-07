class AddVersionToTranslations < ActiveRecord::Migration[6.0]
  def change
    add_column :translations, :version, :string
  end
end
