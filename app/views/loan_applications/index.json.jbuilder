# frozen_string_literal: true

json.array! @loan_applications, partial: 'loan_applications/loan_application', as: :loan_application
