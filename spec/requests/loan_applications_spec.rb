require 'rails_helper'

RSpec.describe "LoanApplications", type: :request do
  describe "GET /index" do
    before do
      @application = create(:loan_application)
      get loan_applications_url
    end

    it "assign @loan_applications" do      
      expect(assigns(:loan_applications)).to include(@application)
    end

    it 'renders a successful response' do
      expect(response).to be_successful
    end

    it "redirecs to /index page" do
      expect(response).to render_template(:index)
    end
  end

  describe "GET /new" do
    let(:loan_application_params) do
      attributes_for :loan_application, business_name: nil
    end

    it "renders /new page" do
      get new_loan_application_url
      expect(response).to render_template(:new)
    end
  end

  describe "POST /create" do
    context "with invalid data" do
      let(:loan_application_params) do
        attributes_for :loan_application, business_name: nil
      end

      it "does not create new application" do
        expect do
          post loan_applications_url, params: { loan_application: loan_application_params }
        end.not_to change(LoanApplication, :count)
      end

      it "renders /new page" do
        post loan_applications_url, params: { loan_application: loan_application_params }
        expect(response).to render_template(:new)
      end
    end

    context "with valid data" do
      let(:loan_application_params) { attributes_for :loan_application }
      it "creates new application" do
        expect do
          post loan_applications_url, params: { loan_application: loan_application_params }
        end.to change(LoanApplication, :count).by(1)
      end

      it "renders /new page" do
        post loan_applications_url, params: { loan_application: loan_application_params }
        expect(response).to redirect_to(loan_application_url(LoanApplication.last))
      end
    end
  end
end
