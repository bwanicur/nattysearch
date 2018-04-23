class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
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
  end
end
