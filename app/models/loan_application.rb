# frozen_string_literal: true

class LoanApplication < ApplicationRecord
  ACCOUNT_PROVIDER = %w[XERO MYOB].freeze
  validates :business_name, :established_year, :amount, :account_provider,
            presence: true

  validates :account_provider, inclusion: { in: ACCOUNT_PROVIDER,
                                            message: '%<value>s is not a valid account provider' }
end
