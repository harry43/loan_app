module AccountProviders
  class Xero < Base
    def balance_sheet
      return retrieve_balance_sheet
    end

    private

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
            profitOrLoss: 190000,
            assetsValue: 55555
        },
        {
            year: 2021,
            month: 4,
            profitOrLoss: -20000,
            assetsValue: 123456
        }
    ]
    end
  end
end
