class AddIteration4ToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :iteration4, :string
  end
end
