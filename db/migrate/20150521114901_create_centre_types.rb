class CreateCentreTypes < ActiveRecord::Migration
  def change
    create_table :centre_types do |t|
      t.string :name, index: true
      t.text :description
      t.timestamps
    end
  end
end
