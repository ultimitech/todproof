class AddDescriptorToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :descriptor, :string
  end
end
