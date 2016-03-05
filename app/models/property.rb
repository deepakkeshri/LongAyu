class Property < ActiveRecord::Base
  
  has_many :centres
  belongs_to :account
  has_many :staffs
  
  validates :name,:website,:language,:timezone,:city,:state,:country,:address_line1, presence: true
end
