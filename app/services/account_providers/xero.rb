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
          "year" => 2023,
          "month" => 11,
          "profitOrLoss" => 5454,
          "assetsValue" => 2222
        },
        {
          "year" => 2023,
          "month" => 10,
          "profitOrLoss" => -2400,
          "assetsValue" => 1111
        },
        {
          "year" => 2023,
          "month" => 9,
          "profitOrLoss" => 190_000,
          "assetsValue" => 55_555
        },
        {
          "year" => 2023,
          "month" => 8,
          "profitOrLoss" => -20_000,
          "assetsValue" => 123_456
        },
        {
          "year" => 2023,
          "month" => 7,
          "profitOrLoss" => 5454,
          "assetsValue" => 2222
        },
        {
          "year" => 2023,
          "month" => 6,
          "profitOrLoss" => -2400,
          "assetsValue" => 1111
        },
        {
          "year" => 2023,
          "month" => 5,
          "profitOrLoss" => 190_000,
          "assetsValue" => 55_555
        },
        {
          "year" => 2023,
          "month" => 4,
          "profitOrLoss" => -20_000,
          "assetsValue" => 123_456
        },
        {
          "year" => 2023,
          "month" => 3,
          "profitOrLoss" => 5454,
          "assetsValue" => 2222
        },
        {
          "year" => 2023,
          "month" => 2,
          "profitOrLoss" => -2400,
          "assetsValue" => 1111
        },
        {
          "year" => 2023,
          "month" => 1,
          "profitOrLoss" => 190_000,
          "assetsValue" => 55_555
        },
        {
          "year" => 2022,
          "month" => 12,
          "profitOrLoss" => -20_000,
          "assetsValue" => 123_456
        }
      ]
    end
    # rubocop:enable Metrics/MethodLength
  end
end
