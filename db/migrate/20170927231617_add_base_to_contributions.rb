class AddBaseToContributions < ActiveRecord::Migration[6.0]
  def change
    add_column :contributions, :base, :string
  end
end
