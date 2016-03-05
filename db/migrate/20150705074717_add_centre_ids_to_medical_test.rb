class AddCentreIdsToMedicalTest < ActiveRecord::Migration
  def change
    add_column :medical_tests, :centre_ids, :string
    add_column :medical_tests, :department, :string
    add_column :medical_tests, :speciality, :string
    add_column :medical_tests, :description, :text
  end
end
