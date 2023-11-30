# frozen_string_literal: true

FactoryBot.define do
  factory :loan_application do
    business_name { Faker::Name.name }
    established_year { 2023 }
    amount { 10_000 }
    account_provider { LoanApplication::ACCOUNT_PROVIDER.sample }
  end
end
