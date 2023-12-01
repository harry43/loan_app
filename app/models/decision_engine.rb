# frozen_string_literal: true

class DecisionEngine < ActiveResource::Base
  self.site = 'http://localhost:3000/decision_engine_api'
  self.element_name = 'loan_application'
end
