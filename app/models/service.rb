class Service < ActiveRecord::Base
  
  belongs_to :service_type
  belongs_to :centre
  belongs_to :serviceable, polymorphic: true

  validates :service_type_id, presence: true
  
  validates :centre_id, presence: true
  
  validates :name, presence: true
  
  validates :price, presence: true



  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      scoped
    end
  end


  def self.import(file, centre_id, service_type_id)
    allowed_attributes = [ "service_type_id", "centre_id", "name", "description", "speciality", "department", "price", "tax", "dd_price", "dd_tax", "doctor_fee", "anesthesia_price", "start_time", "end_time"]
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      service = Service.new
      row['start_time'] = Time.parse(row['start_time']).to_datetime if row['start_time']
      row['end_time'] = Time.parse(row['end_time']).to_datetime if row['end_time']
      service.attributes = row.to_hash.select { |k,v| allowed_attributes.include? k }
      service.centre_id = centre_id
      service.service_type_id = service_type_id
      service.save!
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



end
