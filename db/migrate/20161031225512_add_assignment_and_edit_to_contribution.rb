class AddAssignmentAndEditToContribution < ActiveRecord::Migration[6.0]
  def change
    add_reference :contributions, :assignment, index: true, foreign_key: true
    add_reference :contributions, :edit, index: true, foreign_key: true
  end
end
