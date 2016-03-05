class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :address3
      t.string :landmark1
      t.string :landmark2
      t.string :landmark3
      t.string :city
      t.string :state
      t.string :country
      t.integer :pin
      t.integer :addressable_id
      t.string :addessable_type

      t.timestamps
    end
  end
end
