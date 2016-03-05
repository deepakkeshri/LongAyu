class CreateMedicines < ActiveRecord::Migration
  def change
    create_table :medicines do |t|
      t.string :name
      t.string :short_name
      t.string :alt_name
      t.text :description

      t.timestamps
    end
  end
end
