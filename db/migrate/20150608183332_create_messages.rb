class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :message_type, index: true,null: false
      t.string :name
      t.string :detail
      t.timestamps
    end
  end
end
