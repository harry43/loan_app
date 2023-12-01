# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DecisionEngineParams do
  describe '#build' do
    let(:loan_application) { build(:loan_application, account_provider: 'MYOB') }
    let(:decision_engine_param) { DecisionEngineParams.new(loan_application: loan_application) }
    let(:expected_params) do
      {
        business: {
          name: loan_application.business_name,
          profit_loss_summary: 199_950,
          year: loan_application.established_year
        },
        loan_amount: loan_application.amount,
        preAssessment: 100
      }
    end

    context 'build params for decision engine' do
      it 'return params' do
        response = decision_engine_param.build
        expect(response).to eq(expected_params)
      end
    end
  end
end
