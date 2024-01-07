class AddSubToSentences < ActiveRecord::Migration[6.0]
  def change
    add_column :sentences, :sub, :integer
  end
end
