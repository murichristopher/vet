class ChangeStartTimeToStartOnEvents < ActiveRecord::Migration[7.0]
  def change
    rename_column :events, :start_time, :start
  end
end
