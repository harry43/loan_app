# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountingSoftware do
  context 'with invalid data' do
    it 'returns error message with missing params' do
      software = described_class.new
      response = software.get_balance_sheet

      expect(response[:errors]).to eq(["Business name can't be blank", "Account provider can't be blank"])
    end

    it 'returns error message ion with unknown provider' do
      software = described_class.new(business_name: 'B1', account_provider: 'UnknownProvider')
      response = software.get_balance_sheet

      expect(response[:errors]).to eq(['Provider not implemented: UnknownProvider'])
    end
  end

  context 'with valid data' do
    let(:software) do
      described_class.new(business_name: Faker::Name.name, account_provider: 'myob')
    end

    let(:sample_balance_sheet) do
      [
        {
          "year" => 1989,
          "month" => 4,
          "profitOrLoss" => 10_000,
          "assetsValue" => 222_222
        }
      ]
    end

    it 'returns balance sheet' do
      allow_any_instance_of(AccountProviders::Myob).to receive(:balance_sheet).and_return(sample_balance_sheet)
      balance_sheet = software.get_balance_sheet

      expect(balance_sheet).to eq(sample_balance_sheet)
    end
  end
end
