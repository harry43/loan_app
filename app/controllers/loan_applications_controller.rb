# frozen_string_literal: true

# Loan Application Controller
class LoanApplicationsController < ApplicationController
  before_action :set_loan_application, only: %i[show edit update destroy submit_application]

  def index
    @loan_applications = LoanApplication.all
  end

  def show
    accounting_software = ::AccountingSoftware.new(
      business_name: @loan_application.business_name,
      account_provider: @loan_application.account_provider
    )

    @balance_sheet = accounting_software.balance_sheet
  end

  def new
    @loan_application = LoanApplication.new
  end

  def create
    @loan_application = LoanApplication.new(loan_application_params)

    respond_to do |format|
      if @loan_application.save
        success_response(format)
      else
        error_response(format)
      end
    end
  end

  def submit_application
    decision_engine = DecisionEngine.new
    decision_engine.loan_application = DecisionEngineParams.new(loan_application: @loan_application).build

    decision_engine.save
    @loan_application.update(status: "Submitted")
    flash[:notice] =
      "Application submitted successfully with params #{decision_engine.attributes['loan_application']}"
    redirect_to loan_applications_path
  rescue => e
    flash[:error] = e.message
    redirect_to loan_applications_path
  end

  private

  def success_response(format)
    format.html do
      redirect_to loan_application_url(@loan_application), notice: 'Loan application was successfully created.'
    end
    format.json { render :show, status: :created, location: @loan_application }
  end

  def error_response(format)
    format.html { render :new, status: :unprocessable_entity }
    format.json { render json: @loan_application.errors, status: :unprocessable_entity }
  end

  def set_loan_application
    @loan_application = LoanApplication.find(params[:id])
  end

  def loan_application_params
    params.require(:loan_application).permit(:business_name, :established_year, :account_provider, :amount)
  end
end
