class Staff < ActiveRecord::Base
  
  belongs_to :centre
  belongs_to :staff_type
  
  validates :title, presence: true
  validates :first_name, presence: true,length: { minimum: 5 }
  validates :last_name, presence: true
  validates :gender, presence: true
  validates :centre, presence: true
  validates :gender, presence: true
  validates :staff_type, presence: true
  validates :degree, presence: true
  validates :qualification, presence: true
  validates :designation, presence: true
  validates :specialization, presence: true
  validates :language, presence: true
  validates :email, presence: true
  validates :mobile, presence: true
  validates :address_line1, presence: true
  validates :pincode, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates :country, presence: true
end
