class AddNameToIterations < ActiveRecord::Migration[5.1]
  def change
    	add_column :iterations, :iteration, :string
  end
end
