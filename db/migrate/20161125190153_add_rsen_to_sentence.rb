class AddRsenToSentence < ActiveRecord::Migration[6.0]
  def change
    add_column :sentences, :rsen, :integer
  end
end
