# frozen_string_literal: true

class DecisionEngineParams
  attr_reader :loan_application

  def initialize(loan_application:)
    @loan_application = loan_application
  end

  def build
    build_params
  end

  private

  def build_params
    {
      preAssessment: pre_assessment_calculator.calculate,
      loan_amount: loan_application.amount,
      business: get_business_details
    }
  end

  def get_business_details
    {
      name: loan_application.business_name,
      year: loan_application.established_year,
      profit_loss_summary: pre_assessment_calculator.annual_profit
    }
  end

  def pre_assessment_calculator
    @pre_assessment_calculator ||= PreAssessment.new(
      balance_sheet: accounting_software.balance_sheet,
      loan_amount: loan_application.amount
    )
  end

  def accounting_software
    @accounting_software ||= ::AccountingSoftware.new(
      business_name: loan_application.business_name,
      account_provider: loan_application.account_provider
    )
  end
end
