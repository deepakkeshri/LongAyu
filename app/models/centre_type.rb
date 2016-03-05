class CentreType < ActiveRecord::Base
  
  has_many :centres
  has_many :services
  validates :name, presence: true,length: { minimum: 5 }
  #attributes_accessible :name,:description
  
  def self.import(file)
    spreadsheet = open_spreadsheet(file)# || Roo::Excelx.new('./public/centre_types.xlsx')
    #spreadsheet = Roo::Spreadsheet.open(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      centre_type = find_by_id(row["id"]) || new
      centre_type.attributes = row.to_hash#.slice(attr_accessible)
      centre_type.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file)
      when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.name}"
    end
  end
  
end
