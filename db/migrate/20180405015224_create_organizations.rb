class CreateOrganizations < ActiveRecord::Migration[5.1]
  def up 
    create_table :organizations do |t|
      t.timestamp :last_updated_at
      t.decimal :latitude
      t.decimal :longitude
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.string :phone
      t.string :phone2
      t.string :fax
      t.string :email
      t.text :about
      t.jsonb :urls
      t.jsonb :api_specific_data
      t.timestamps
    end
    add_index :organizations, :last_updated_at
    add_index :organizations, :api_specific_data, using: :gin
    execute <<-SQL
      CREATE INDEX organizations_pf_id ON organizations((api_specific_data->>'pf_id'))
    SQL
  end

  def down
    drop_table :organizations
  end
end
