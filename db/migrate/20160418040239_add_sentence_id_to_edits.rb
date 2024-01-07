class AddSentenceIdToEdits < ActiveRecord::Migration[6.0]
  def change
    add_column :edits, :sentence_id, :integer
  end
end
