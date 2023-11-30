require 'rails_helper'

class SampleProvider < AccountProviders::Base
end

RSpec.describe AccountProviders::Base do
  describe "#initialize" do
    context "when businessname is not provided" do
      it "returns ArgumentError" do
        expect {SampleProvider.new }.to raise_exception(ArgumentError)
      end
    end
  end
  describe "#balance_sheet" do
    context "method not implemented" do
      it "raises error" do
        provider = SampleProvider.new(business_name: "B1")
        expect{ provider.balance_sheet }.to raise_exception(NotImplementedError)
      end
    end
  end
end
