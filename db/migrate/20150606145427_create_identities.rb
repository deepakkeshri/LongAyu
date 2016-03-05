class CreateIdentities < ActiveRecord::Migration
  def change
    create_table :identities do |t|
      t.references :account, index: true,null: false, default: ""
      t.string :provider
      t.string :uid
      t.string :oauth_token
      t.datetime :oauth_expires_at
      t.timestamps
    end
  end
end
