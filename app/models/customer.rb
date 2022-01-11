class Customer < ApplicationRecord
	def get_staff_name
		Account.find(self.staff_id).name
	end

	def get_staff_phone
		Account.find(self.staff_id).phone
	end

	def self.import(file, role_id, staff_id)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    num = 0
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      customer = find_by_id(row["id"]) || new
      customer.attributes = row.to_hash.slice(*row.to_hash.keys)
      customer.customer_role_id = role_id
      customer.staff_id = staff_id
      customer.save!
	    @contact2 = Contact.new
			@contact2.customer_id = customer.id
			@contact2.name = customer.name
			@contact2.phone = customer.phone
			@contact2.email = customer.email
			@contact2.designation = "Owner"
			@contact2.save
			num+=1
    end
    num
	end

	def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
	end
end
