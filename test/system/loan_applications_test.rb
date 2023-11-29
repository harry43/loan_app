require "application_system_test_case"

class LoanApplicationsTest < ApplicationSystemTestCase
  setup do
    @loan_application = loan_applications(:one)
  end

  test "visiting the index" do
    visit loan_applications_url
    assert_selector "h1", text: "Loan applications"
  end

  test "should create loan application" do
    visit loan_applications_url
    click_on "New loan application"

    fill_in "Account provider", with: @loan_application.account_provider
    fill_in "Amount", with: @loan_application.amount
    fill_in "Business name", with: @loan_application.business_name
    fill_in "Established year", with: @loan_application.established_year
    click_on "Create Loan application"

    assert_text "Loan application was successfully created"
    click_on "Back"
  end

  test "should update Loan application" do
    visit loan_application_url(@loan_application)
    click_on "Edit this loan application", match: :first

    fill_in "Account provider", with: @loan_application.account_provider
    fill_in "Amount", with: @loan_application.amount
    fill_in "Business name", with: @loan_application.business_name
    fill_in "Established year", with: @loan_application.established_year
    click_on "Update Loan application"

    assert_text "Loan application was successfully updated"
    click_on "Back"
  end

  test "should destroy Loan application" do
    visit loan_application_url(@loan_application)
    click_on "Destroy this loan application", match: :first

    assert_text "Loan application was successfully destroyed"
  end
end
