class FixParNameInSentences < ActiveRecord::Migration[6.0]
  def change
    rename_column :sentences, :par, :rsub
  end
end
