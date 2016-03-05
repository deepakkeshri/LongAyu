class CreateCountryMobileCodes < ActiveRecord::Migration
  def change
    create_table :country_mobile_codes do |t|
      t.string :name,default: "+91"
      t.timestamps
    end
  end
end
