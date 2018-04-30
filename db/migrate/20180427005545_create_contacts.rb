class CreateContacts < ActiveRecord::Migration[5.1]
  def change
    create_table :contacts do |t|
      t.string :contactable_id
      t.string :contactable_type
      t.timestamp :last_updated_at
      t.string :full_name
      t.string :email
      t.string :phone
      t.string :phone2
      t.text :notes
      t.timestamps
    end
    add_index :contacts, [:contactable_type, :contactable_id], unique: true
    add_index :contacts, :last_updated_at
  end
end
