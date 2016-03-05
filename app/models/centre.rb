class Centre < ActiveRecord::Base
  belongs_to :centre_type
  #belongs_to :property
  belongs_to :account
  has_many :centres
  has_many :staffs
  has_many :services
  has_many :facilities
  geocoded_by :full_address   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates
  def self.sort_by_price(serviceable_type, serviceable_id)
    order(services.where(serviceable_type: 'MedicalTest', serviceable_id: 2).map {|s| getPayablePrice(s)}.sum)
  end
  default_scope {order('distance ASC')}

  #reverse_geocoded_by :latitude, :longitude
  #after_validation :reverse_geocode  # auto-fetch address
  #has_attached_file :avatar,:styles => {:medium => "300x300",:thumb => "100x100"},:default_url => "/images/centre/missing.png"
  
  #validates :attachment, presence: true , content_type:  {:content_type => "image/jpeg"},size: {:in => 0..10.kilobytes}
  
  #validates_attachment_file_name :avatar, :matches => [/png\Z/ ,/jpeg\Z/]
  
  validates :name, presence: true,length: { minimum: 5 }

  default_scope { order('distance ASC') }


  def self.import(file, centre_id, centre_type_id)
    allowed_attributes = ['name','company','website','centre_type_id','centre_id','secondary_email',
                          'close_day','open_time','close_time','lunch_start_time','lunch_end_time','employee_count','currency',
                          'minimum_consultancy_fee','address_line1','address_line2','address_line3',
                          'landmark1','landmark2','landmark3','country_mobile_code','secondary_mobile',
                          'country_mobile_code','pincode','city','state','country']

    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      centre = Centre.new
      row['open_time'] = Time.parse(row['open_time']).to_datetime if row['open_time']
      row['close_time'] = Time.parse(row['close_time']).to_datetime if row['close_time']
      row['lunch_start_time'] = Time.parse(row['lunch_start_time']).to_datetime if row['lunch_start_time']
      row['lunch_end_time'] = Time.parse(row['lunch_end_time']).to_datetime if row['lunch_end_time']
      centre.attributes = row.to_hash.select { |k,v| allowed_attributes.include? k }
      centre.centre_id = centre_id if centre_id
      centre.centre_type_id = centre_type_id
      centre.account_id = 0
      centre.save!
      centre.centre_id = centre.id
      centre.save
    end
  end



  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, packed: nil, file_warning: :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, packed: nil, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def full_address
    [address_line1, address_line2, address_line3, city, pincode, state, country].compact.join(', ')
  end
end
