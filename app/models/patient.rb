class Patient < ActiveRecord::Base
  
  belongs_to :account
  
end
