class RenameTypeToKind < ActiveRecord::Migration[6.0]
  def change
    rename_column :contributions, :type, :kind
  end
end
