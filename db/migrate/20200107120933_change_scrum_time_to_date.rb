class ChangeScrumTimeToDate < ActiveRecord::Migration[5.1]
  def change
    change_column :teams, :scrum_time, :datetime 
  end

end
