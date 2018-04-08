class CreateOrganizations < ActiveRecord::Migration[5.1]
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :country
      t.decimal :latitude
      t.decimal :longitude
      t.string :phone
      t.string :phone2
      t.string :fax
      t.string :email
      t.string :website_url
      t.string :facebook_url
      t.text :about

      t.timestamps
    end
  end
end
