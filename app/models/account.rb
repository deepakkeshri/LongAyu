class Account < ActiveRecord::Base
  rolify #:before_add => :before_add_method
  
  # Include default devise modules. Others available are:
  attr_accessor :login
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :timeoutable,:omniauthable, :confirmable
         
  has_one :property
  has_one :centre
  has_one :patient

  validates :mobile,uniqueness: true ,format: {with: /(\d{10}|\d{3}\)?[-.]\d{3}[-.]\d{4})/ ,message: "number should be of 10 integers"}, presence: true
  validates :terms_of_service, acceptance: true
  #as_enum :role, [:admin,:property,:centre,:patient]
  #validates_as_enum :role
  
  accepts_nested_attributes_for :property, allow_destroy: true
  accepts_nested_attributes_for :centre,  allow_destroy: true
  accepts_nested_attributes_for :patient,allow_destroy: true
  
  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(mobile) = :value OR lower(email) = :value",{:value => login.downcase}]).first
    else
      where(conditions.to_h).first 
    end
  end

end
