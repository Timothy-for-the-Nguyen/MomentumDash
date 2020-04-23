class AddIterationupdateToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :iteration_update, :datetime
  end
end
