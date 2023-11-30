# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoanApplication, type: :model do
  it { should validate_presence_of(:business_name) }
  it { should validate_presence_of(:established_year) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:account_provider) }

  it {
    should validate_inclusion_of(:account_provider)
      .in_array(LoanApplication::ACCOUNT_PROVIDER)
      .with_message('Shoulda::Matchers::ExampleClass is not a valid account provider')
  }
end
