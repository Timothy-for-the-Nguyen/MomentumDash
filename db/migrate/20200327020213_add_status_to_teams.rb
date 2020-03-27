class AddStatusToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :status1, :string
    add_column :teams, :status2, :string
    add_column :teams, :status3, :string
    add_column :teams, :status4, :string
  end
end
