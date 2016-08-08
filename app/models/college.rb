class College < ActiveRecord::Base
  belongs_to :district
  has_many :college_emails
  has_many :college_contact_details

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|

      row = Hash[[header, spreadsheet.row(i)].transpose]
      district = District.where(name: row['District'])[0]
      college = College.where(name: row['Colleges']).first_or_create
      college.address = row['College details']
      college.coordinator = row['Coordinator']
      college.district_id =  district.id
      row['Placement details'].split(',').each do |p_details|
        college_emails = CollegeEmail.new
        college_emails.emails = p_details
        college_emails.college_id =  college.id
        college_emails.save!
      end
      row['Contact details'].split(',').each do |c_details|
        college_contact_detail = CollegeContactDetail.new
        college_contact_detail.phone = c_details
        college_contact_detail.college_id =  college.id
        college_contact_detail.save!
      end
      college.save!

    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, file_warning: :ignore)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end
end
