json.extract! loan_application, :id, :business_name, :established_year, :account_provider, :amount, :created_at, :updated_at
json.url loan_application_url(loan_application, format: :json)
