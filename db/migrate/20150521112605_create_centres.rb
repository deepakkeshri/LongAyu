class CreateCentres < ActiveRecord::Migration
  def change
    create_table :centres do |t|
      t.references :account, index: true,null: false
      t.references :centre, index: true,null: false, default: "0"
      t.references :centre_type, default: '1'
      t.string :unique_id,default: "12345"
      t.string :name, default: "Branch"
      t.string :company
      t.string :website,default: "https://example.com"
      t.string :close_day
      t.datetime :open_time
      t.datetime :close_time
      t.datetime :lunch_start_time
      t.datetime :lunch_end_time
      t.string :employee_count
      t.string :currency,default: "INR"
      t.float :minimum_consultancy_fee ,default: "0.0"
      t.string :secondary_email
      t.string :country_mobile_code,default: "+91"
      t.string :secondary_mobile
      t.float :latitude
      t.float :longitude
      t.float :distance
      t.string :video_link
      t.string :association
      t.string :accreditation
      t.integer :establishment
      t.timestamps
    end
  end
end
