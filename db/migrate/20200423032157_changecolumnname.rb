class Changecolumnname < ActiveRecord::Migration[5.1]
  def change
  	unless column_exists? :requests, :section_id
    	rename_column :requests, :section, :section_id
    end
  end
end
