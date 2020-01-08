class CreateProgresstables < ActiveRecord::Migration[5.1]
  def change
    create_table :progresstables do |t|
      t.string :iteration1
      t.string :iteration2
      t.string :iteration3

      t.timestamps
    end
  end
end
