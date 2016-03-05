class CreateSubServiceTypes < ActiveRecord::Migration
  def change
    create_table :sub_service_types do |t|
      t.references :service_type, index: true,null: false
      t.string :name
      t.timestamps
    end
  end
end
