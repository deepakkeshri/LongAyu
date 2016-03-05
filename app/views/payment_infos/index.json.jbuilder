json.array!(@payment_infos) do |payment_info|
  json.extract! payment_info, :id, :currency, :cheque_accept, :cheque_accept_description, :debit_accept, :debit_accept_description, :credit_accept, :credit_accept_description, :wallet_accept, :wallet_accept_description, :cash_accept, :cash_accept_description, :centre_id
  json.url payment_info_url(payment_info, format: :json)
end
