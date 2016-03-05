class CreatePaymentInfos < ActiveRecord::Migration
  def change
    create_table :payment_infos do |t|
      t.string :currency
      t.boolean :cheque_accept
      t.text :cheque_accept_description
      t.boolean :debit_accept
      t.text :debit_accept_description
      t.boolean :credit_accept
      t.text :credit_accept_description
      t.boolean :wallet_accept
      t.text :wallet_accept_description
      t.boolean :cash_accept
      t.text :cash_accept_description
      t.integer :centre_id

      t.timestamps
    end
  end
end
