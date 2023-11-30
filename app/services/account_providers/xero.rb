# frozen_string_literal: true

module AccountProviders
  class Xero < Base
    def balance_sheet
      retrieve_balance_sheet
    end

    private

    # rubocop:disable Metrics/MethodLength
    def retrieve_balance_sheet
      [
        {
          year: 2021,
          month: 1,
          profitOrLoss: 5454,
          assetsValue: 2222
        },
        {
          year: 2021,
          month: 2,
          profitOrLoss: -2400,
          assetsValue: 1111
        },
        {
          year: 2021,
          month: 3,
          profitOrLoss: 190_000,
          assetsValue: 55_555
        },
        {
          year: 2021,
          month: 4,
          profitOrLoss: -20_000,
          assetsValue: 123_456
        }
      ]
    end
    # rubocop:enable Metrics/MethodLength
  end
end
