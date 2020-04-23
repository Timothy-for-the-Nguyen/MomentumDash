class AddShowUpdateToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :last_update, :time
  end
end
