# frozen_string_literal: true

module DecisionEngineApi
  class LoanApplicationsController < ApplicationController
    protect_from_forgery with: :null_session

    def create
      render json: {
        message: 'Successfully submitted the loan application',
        data: application_params.except(:preAssessment)
      }, status: 200
    end

    private

    def application_params
      params.require(:loan_application)
            .permit(:loan_amount, :preAssessment, business: %i[name year profit_loss_summary])
    end
  end
end
