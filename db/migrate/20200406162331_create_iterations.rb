class CreateIterations < ActiveRecord::Migration[5.1]
  def change
    create_table :iterations do |t|
      t.string :status
      t.string :comments
      t.references :team, foreign_key: true

      t.timestamps
    end
  end
end
