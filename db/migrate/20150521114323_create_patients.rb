class CreatePatients < ActiveRecord::Migration
  def change
    create_table :patients do |t|
      t.references :account, index: true
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :title
      t.string :qualification
      t.references :country_mobile_code, index: true
      t.integer :mobile_contact_no
      t.integer :home_contact_no
      t.integer :landline_no
      t.integer :fax_no
      t.integer :work_contact_no
      t.string :address_line1
      t.string :address_line2
      t.string :address_line3
      t.references :city, index: true
      t.references :state, index: true
      t.references :country, index: true
      t.references :postal_code, index: true
      t.attachment :photo
      t.boolean :hide_name_in_review, :default => false
      t.boolean :hide_photo_in_review, :default => false
      t.boolean :email_subscription, :default => false
      t.boolean :sms_subscription, :default => false
      t.string :blood_group
      t.date :dob
      t.float :height
      t.float :weight
      t.string :gender
      t.string :language
      t.string :allergies
      t.timestamps
    end
  end
end

