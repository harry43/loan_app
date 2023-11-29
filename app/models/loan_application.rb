class LoanApplication < ApplicationRecord
  ACCOUNT_PROVIDER = ["XERO", "MYOB"]  
  validates :business_name, :established_year, :amount, :account_provider,
            presence: true
            
  validates :account_provider, inclusion: { in: ACCOUNT_PROVIDER,
    message: "%{value} is not a valid account provider" }

end
