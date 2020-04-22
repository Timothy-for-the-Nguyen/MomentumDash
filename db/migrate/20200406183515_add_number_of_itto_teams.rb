class AddNumberOfIttoTeams < ActiveRecord::Migration[5.1]
  def change
  	unless column_exists? :iterations, :iteration
    	add_column :iterations, :iteration, :string
 	end
  end
end
