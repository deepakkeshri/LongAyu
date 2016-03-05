class CreateServiceTypes < ActiveRecord::Migration
  def change
    create_table :service_types do |t|
      t.references :centre_type
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
