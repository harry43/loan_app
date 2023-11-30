module AccountProviders
  class Base
    attr_accessor :business_name

    def initialize(business_name:)
      @business_name = business_name
    end

    def balance_sheet
      raise NotImplementedError, "Method not implemented"
    end
  end
end