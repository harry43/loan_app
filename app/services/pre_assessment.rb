# frozen_string_literal: true

class PreAssessment
  attr_reader :balance_sheet, :loan_amount

  def initialize(balance_sheet:, loan_amount:)
    @balance_sheet = balance_sheet
    @loan_amount = loan_amount
  end

  def calculate
    calculate_assessment
  end

  private

  def calculate_assessment
    return 100 if annual_profit > 0 && average_assets_value > loan_amount
    return 60 if annual_profit > 0

    20
  end

  def annual_profit
    balance_sheet.sum {|h| h["profitOrLoss"] }
  end

  def average_assets_value
    balance_sheet.sum {|h| h["assetsValue"] } / 12
  end
end
