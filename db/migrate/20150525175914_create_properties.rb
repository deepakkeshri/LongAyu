class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.references :account, index: true, null: false, default: ""
      t.string :name
      t.string :property_id
      t.string :website,default: "https://example.com"
      t.string :language
      t.string :timezone
      t.string :country_mobile_code,default: "+91"
      t.string :secondary_mobile
      t.string :secondary_email
      t.string :address_line1
      t.string :address_line2
      t.string :landmark
      t.string :city
      t.string :state
      t.string :country
      t.timestamps
    end
  end
end
