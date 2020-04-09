class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.string :username
      t.string :password_digest
      t.string :name
      t.string :job_title

      t.timestamps
    end
  end
end
