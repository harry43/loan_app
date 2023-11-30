class DecisionMaker < ActiveResource::Base
  self.site = "http://localhost:3000/decision_engine"
  self.element_name = "loan_application"
end
