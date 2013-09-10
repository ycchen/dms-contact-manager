json.array!(@contacts) do |contact|
  json.extract! contact, :first_name, :middle_name, :last_name, :suffix, :company, :department, :job_title, :business_street, :business_city, :business_state, :business_zipcode, :business_fax, :business_phone, :business_phone2, :company_phone, :home_phone, :mobile_phone, :other_phone, :email, :website
  json.url contact_url(contact, format: :json)
end
