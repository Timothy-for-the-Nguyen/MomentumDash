class AddPhasesToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :phase, :string
  end
end
