require 'httparty'
require 'hashie'
require 'active_support/dependencies/autoload'

module Vindicia
  extend ActiveSupport::Autoload

  class << self
    attr_accessor :username, :password

    def config(hash = {})
      if block_given?
        yield(self)
      else
        hash.each { |k, v| self.send("#{k}=", v) }
      end
    end

  end

  def self.production!
    Vindicia::Request.base_uri('https://api.vindicia.com')
  end

  def self.sandbox!
    Vindicia::Request.base_uri('https://api.prodtest.vindicia.com')
  end

  def self.test!
    Vindicia::Request.base_uri('http://example.com')
    Vindicia.username = 'username'
    Vindicia.password = 'password'
  end

  eager_autoload do
    autoload :VERSION
    autoload :Exception
    autoload :Type
    autoload :Request

    autoload_under 'model' do
      autoload :Model
      autoload :Account
      autoload :Address
      autoload :BillingPlan
      autoload :BillingPlanPeriod
      autoload :CreditCard
      autoload :Description
      autoload :Entitlement
      autoload :PayPal
      autoload :PaymentMethod
      autoload :Period
      autoload :Price
      autoload :Product
      autoload :ProductDescription
      autoload :ProductPrice
      autoload :Subscription
      autoload :SubscriptionItem
      autoload :Transaction
      autoload :TransactionItem
      autoload :TransactionStatus
      autoload :TransactionStatusPayPal
    end
  end

  module Concern
    autoload :Objectable, 'vindicia/concern/objectable'
  end

  module Vindicia::Repository
    autoload :Base,          'vindicia/repository/base'
    autoload :Account,       'vindicia/repository/account'
    autoload :BillingPlan,   'vindicia/repository/billing_plan'
    autoload :PaymentMethod, 'vindicia/repository/payment_method'
    autoload :Product,       'vindicia/repository/product'
    autoload :Subscription,  'vindicia/repository/subscription'
    autoload :Transaction,   'vindicia/repository/transaction'
  end
end
