class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.references :service_type, index: true
      t.references :centre, index: true
      t.string :name
      t.text :description
      t.string :speciality
      t.string :department
      t.float :price
      t.float :tax
      t.float :dd_price
      t.float :dd_tax
      t.float :doctor_fee
      t.float :anesthesia_price
      t.datetime :start_time
      t.datetime :end_time
      t.timestamps
    end
  end
end
