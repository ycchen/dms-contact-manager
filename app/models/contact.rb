class Contact < ActiveRecord::Base

	def self.to_csv(options ={})
		CSV.generate(options) do |csv|
			csv << column_names
			all.each do |contact|
				csv << contact.attributes.values_at(*column_names)
			end
		end
	end

	def self.import(file)	
		CSV.foreach(file.path, headers: true) do |row|
			Contact.create! row.to_hash	
		end
	end

	# def self.import(file)	
	# 	allowed_attributes = ['id', 'first_name', 'middle_name', 'last_name', 'suffix', 'company', 'department', 'job_title', 'business_street', 'business_city', 'business_state', 'business_zipcode', 'business_fax', 'business_phone', 'business_phone2', 'company_phone', 'home_phone', 'mobile_phone', 'other_phone', 'email', 'website']
	# 	CSV.foreach(file.path, headers: true) do |row|
	# 		contact = where(:id, row["id"]) || new
	# 		# contact.attributes = row.to_hash.slice(*['first_name', 'middle_name', 'last_name', 'suffix', 'company', 'department', 'job_title', 'business_street', 'business_city', 'business_state', 'business_zipcode', 'business_fax', 'business_phone', 'business_phone2', 'company_phone', 'home_phone', 'mobile_phone', 'other_phone', 'email', 'website'])
	# 		contact.attributes = row.to_hash.select { |k,v| allowed_attributes.include? k }
	# 		contact.save!
	# 	end
	# end
end
