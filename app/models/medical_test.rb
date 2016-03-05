class MedicalTest < ActiveRecord::Base
  has_many :services, :as => :serviceable
end
