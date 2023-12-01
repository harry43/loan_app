# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'LoanApplications', type: :request do
  describe 'GET /index' do
    before do
      @application = create(:loan_application)
      get loan_applications_url
    end

    it 'assign @loan_applications' do
      expect(assigns(:loan_applications)).to include(@application)
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it 'redirecs to /index page' do
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /new' do
    let(:loan_application_params) do
      attributes_for :loan_application, business_name: nil
    end

    it 'renders /new page' do
      get new_loan_application_url
      expect(response).to render_template(:new)
    end
  end

  describe 'POST /create' do
    context 'with invalid data' do
      let(:loan_application_params) do
        attributes_for :loan_application, business_name: nil
      end

      it 'does not create new application' do
        expect do
          post loan_applications_url, params: { loan_application: loan_application_params }
        end.not_to change(LoanApplication, :count)
      end

      it 'renders /new page' do
        post loan_applications_url, params: { loan_application: loan_application_params }
        expect(response).to render_template(:new)
      end
    end

    context 'with valid data' do
      let(:loan_application_params) { attributes_for :loan_application }
      it 'creates new application' do
        expect do
          post loan_applications_url, params: { loan_application: loan_application_params }
        end.to change(LoanApplication, :count).by(1)
      end

      it 'redirect to application show page' do
        post loan_applications_url, params: { loan_application: loan_application_params }
        expect(response).to redirect_to(loan_application_url(LoanApplication.last))
      end
    end
  end

  describe 'POST /submit_application' do
    context 'with valid data' do
      before(:all) do
        @loan_application = create(:loan_application, account_provider: 'MYOB')

        ActiveResource::HttpMock.respond_to do |mock|
          mock.post "/decision_engine_api/loan_applications.json",
                   { 'Content-Type' => 'application/json' },
                   successful_response.to_json,
                   200
        end

        post submit_application_loan_application_path(@loan_application)
      end

      it 'updates the loan application' do
        @loan_application.reload
        expect(@loan_application.status).to eq("Submitted")
      end

      it 'redirects to application list' do
        expect(response).to redirect_to(loan_applications_path)
      end
    end

    context 'with invalid data' do
      before(:all) do
        @loan_application = create(:loan_application, account_provider: 'MYOB')

        ActiveResource::HttpMock.respond_to do |mock|
          mock.post "/decision_engine_api/loan_applications.json",
                   { 'Content-Type' => 'application/json' },
                   failed_response.to_json,
                   422
        end

        post submit_application_loan_application_path(@loan_application)
      end

      it 'does not update the loan application' do
        @loan_application.reload
        expect(@loan_application.status).to be_nil
      end

      it 'redirects to application list' do
        expect(response).to redirect_to(loan_applications_path)
      end
    end
  end
end

def successful_response
  {
    message: 'Successfully submitted the loan application',
    data: {
      amount: 1234
    }
  }
end

def failed_response
  {
    errors: "Something went wrong"
  }
end