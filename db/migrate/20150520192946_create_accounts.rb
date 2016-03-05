class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :mobile,null: false,unique: true
      t.timestamps
    end
     
  end
  
  def self.down
    # By default, we don't want to make any assumption about how to roll back a migration when your
    # model already existed. Please edit below which fields you would like to remove in this migration.
    #raise ActiveRecord::IrreversibleMigration
  end
  
end
