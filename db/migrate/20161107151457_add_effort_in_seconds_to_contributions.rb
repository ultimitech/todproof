class AddEffortInSecondsToContributions < ActiveRecord::Migration[6.0]
  def change
    add_column :contributions, :effort_in_seconds, :integer, :null => false, :default => 0
  end
end
