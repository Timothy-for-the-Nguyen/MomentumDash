class AddTeacherStuffToIterations < ActiveRecord::Migration[5.1]
  def change
    add_column :iterations, :teacher_comment, :string
    add_column :iterations, :teacher_status, :string
  end
end
