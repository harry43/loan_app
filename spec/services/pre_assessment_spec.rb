# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PreAssessment do
  context 'with no profit in last 12 months' do
    subject do
      described_class.new(
        balance_sheet: read_file('spec/support/balance_sheets/no_profit.json'),
        loan_amount: 10_000
      )
    end

    its(:calculate) { is_expected.to eq(20) }

    its(:annual_profit) { is_expected.to be_zero }
  end

  context 'with last 12 months profit and assets < loan amount' do
    subject do
      described_class.new(
        balance_sheet: read_file('spec/support/balance_sheets/with_profit.json'),
        loan_amount: 20_000
      )
    end

    its(:calculate) { is_expected.to eq(60) }
    its(:annual_profit) { is_expected.to eq(4000) }
  end

  context 'with last month profit and enough assets > loan amount' do
    subject do
      described_class.new(
        balance_sheet: read_file('spec/support/balance_sheets/with_profit.json'),
        loan_amount: 10_000
      )
    end

    its(:calculate) { is_expected.to eq(100) }
    its(:annual_profit) { is_expected.to eq(4000) }
  end

  def read_file(file)
    JSON.load(open(file))
  end
end
