class AddIterationNumbersToTeams < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :iteration_number, :string
  end
end
