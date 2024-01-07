class AddEngTranIdToTranslation < ActiveRecord::Migration[6.0]
  def change
    add_column :translations, :eng_tran_id, :integer
  end
end
