class RemoveStartTimeFromLogs < ActiveRecord::Migration[6.0]
  def change

    remove_column :logs, :start_time, :datetime
  end
end
