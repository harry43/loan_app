# frozen_string_literal: true

module AccountProviders
  class Myob < Base
    def balance_sheet
      retrieve_balance_sheet
    end

    private

    # rubocop:disable Metrics/MethodLength
    def retrieve_balance_sheet
      [
        {
          year: 2020,
          month: 12,
          profitOrLoss: 250_000,
          assetsValue: 1234
        },
        {
          year: 2020,
          month: 11,
          profitOrLoss: 1150,
          assetsValue: 5789
        },
        {
          year: 2020,
          month: 10,
          profitOrLoss: 2500,
          assetsValue: 22_345
        },
        {
          year: 2020,
          month: 9,
          profitOrLoss: -187_000,
          assetsValue: 223_452
        }
      ]
    end
    # rubocop:enable Metrics/MethodLength
  end
end
