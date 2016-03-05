class Facility < ActiveRecord::Base
  
  belongs_to :facility_type
  belongs_to :centre
  
  validates :facility_type_id, presence: true
  
  validates :centre_id, presence: true
  
  validates :name, presence: true
  
  validates :price, presence: true
  
end
