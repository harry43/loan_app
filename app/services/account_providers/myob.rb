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
          "year" => 2023,
          "month" => 11,
          "profitOrLoss" => 250_000,
          "assetsValue" => 1234
        },
        {
          "year" => 2023,
          "month" => 10,
          "profitOrLoss" => 1150,
          "assetsValue" => 5789
        },
        {
          "year" => 2023,
          "month" => 9,
          "profitOrLoss" => 2500,
          "assetsValue" => 22_345
        },
        {
          "year" => 2023,
          "month" => 8,
          "profitOrLoss" => -187_000,
          "assetsValue" => 223_452
        },
        {
          "year" => 2023,
          "month" => 7,
          "profitOrLoss" => 250_000,
          "assetsValue" => 1234
        },
        {
          "year" => 2023,
          "month" => 6,
          "profitOrLoss" => 1150,
          "assetsValue" => 5789
        },
        {
          "year" => 2023,
          "month" => 5,
          "profitOrLoss" => 2500,
          "assetsValue" => 22_345
        },
        {
          "year" => 2023,
          "month" => 4,
          "profitOrLoss" => -187_000,
          "assetsValue" => 223_452
        },
        {
          "year" => 2023,
          "month" => 3,
          "profitOrLoss" => 250_000,
          "assetsValue" => 1234
        },
        {
          "year" => 2023,
          "month" => 2,
          "profitOrLoss" => 1150,
          "assetsValue" => 5789
        },
        {
          "year" => 2023,
          "month" => 1,
          "profitOrLoss" => 2500,
          "assetsValue" => 22_345
        },
        {
          "year" => 2022,
          "month" => 12,
          "profitOrLoss" => -187_000,
          "assetsValue" => 223_452
        }
      ]
    end
    # rubocop:enable Metrics/MethodLength
  end
end
