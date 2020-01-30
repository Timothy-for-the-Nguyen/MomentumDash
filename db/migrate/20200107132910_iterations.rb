class Iterations < ActiveRecord::Migration[5.1]
  def change
    add_column :teams, :iteration1, :string
    add_column :teams, :iteration2, :string
    add_column :teams, :iteration3, :string
  end
end
