# frozen_string_literal: true

class AccountingSoftware
  include ActiveModel::Validations

  attr_accessor :business_name, :account_provider

  validates :business_name, :account_provider, presence: true

  def initialize(params = {})
    @business_name = params[:business_name]
    @account_provider = params[:account_provider]
  end

  def balance_sheet
    return { errors: errors.full_messages } unless valid?

    provider.balance_sheet
  rescue StandardError => e
    { errors: [e.to_s] }
  end

  private

  def provider
    @provider ||= provider_class.new(business_name: business_name)
  end

  def provider_class
    provider_name = account_provider.downcase.classify
    "AccountProviders::#{provider_name}".constantize
  rescue StandardError
    raise StandardError, "Provider not implemented: #{account_provider}"
  end
end
