class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :course
      t.string :section
      t.string :email
      t.string :name
      t.boolean :accepted

      t.timestamps
    end
  end
end
