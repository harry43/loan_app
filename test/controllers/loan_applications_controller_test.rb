require "test_helper"

class LoanApplicationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @loan_application = loan_applications(:one)
  end

  test "should get index" do
    get loan_applications_url
    assert_response :success
  end

  test "should get new" do
    get new_loan_application_url
    assert_response :success
  end

  test "should create loan_application" do
    assert_difference("LoanApplication.count") do
      post loan_applications_url, params: { loan_application: { account_provider: @loan_application.account_provider, amount: @loan_application.amount, business_name: @loan_application.business_name, established_year: @loan_application.established_year } }
    end

    assert_redirected_to loan_application_url(LoanApplication.last)
  end

  test "should show loan_application" do
    get loan_application_url(@loan_application)
    assert_response :success
  end

  test "should get edit" do
    get edit_loan_application_url(@loan_application)
    assert_response :success
  end

  test "should update loan_application" do
    patch loan_application_url(@loan_application), params: { loan_application: { account_provider: @loan_application.account_provider, amount: @loan_application.amount, business_name: @loan_application.business_name, established_year: @loan_application.established_year } }
    assert_redirected_to loan_application_url(@loan_application)
  end

  test "should destroy loan_application" do
    assert_difference("LoanApplication.count", -1) do
      delete loan_application_url(@loan_application)
    end

    assert_redirected_to loan_applications_url
  end
end
