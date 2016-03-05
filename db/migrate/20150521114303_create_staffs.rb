class CreateStaffs < ActiveRecord::Migration
  def change
    create_table :staffs do |t|
      t.references :property, index: true
      t.references :staff_type, index: true
      t.string :staff_id
      t.string :centre
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :gender
      t.string :email
      t.string :country_mobile_code,default: "+91"
      t.integer :mobile
      t.datetime :start_time
      t.datetime :end_time
      t.integer :designation
      t.text :biography
      t.integer :qualification
      t.string :degree
      t.string :specialization
      t.string :language
      t.string :address_line1
      t.string :address_line2
      t.string :address_line3
      t.integer :pincode
      t.string :city
      t.string :state
      t.string :country,default: "India" 
      t.timestamps
    end
  end
end
