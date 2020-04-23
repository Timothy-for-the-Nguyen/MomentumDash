class Changecolumnname < ActiveRecord::Migration[5.1]
  def change
    	rename_column :requests, :section, :section_id
  end
end
