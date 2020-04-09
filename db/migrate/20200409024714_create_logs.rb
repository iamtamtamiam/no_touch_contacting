class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.integer :employee_id
      t.integer :contact_id
      t.string :communication_type
      t.datetime :date
      t.datetime :start_time
      t.boolean :answered
      t.text :log_notes

      t.timestamps
    end
  end
end
