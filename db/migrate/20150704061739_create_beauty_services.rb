class CreateBeautyServices < ActiveRecord::Migration
  def change
    create_table :beauty_services do |t|
      t.string :name
      t.string :short_name
      t.string :alt_name
      t.string :department
      t.string :speciality
      t.text :description

      t.timestamps
    end
  end
end
