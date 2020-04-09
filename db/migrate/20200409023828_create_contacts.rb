class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :description
      t.text :notes

      t.timestamps
    end
  end
end
