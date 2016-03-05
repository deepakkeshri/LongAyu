class CreateMedicalTests < ActiveRecord::Migration
  def change
    create_table :medical_tests do |t|
      t.string :name, :null => false
      t.string :short_name
      t.string :alt_name

      t.timestamps
    end
  end
end
