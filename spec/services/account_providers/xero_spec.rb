# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountProviders::Xero do
  describe '#balance_sheet' do
    it 'returns balance sheet' do
      provider = described_class.new(business_name: 'B1')
      expect(provider.balance_sheet).to be_a Array
    end
  end
end
