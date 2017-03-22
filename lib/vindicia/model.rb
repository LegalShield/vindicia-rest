module Vindicia::Model
  autoload :Base,                    'vindicia/model/base'
  autoload :Account,                 'vindicia/model/account'
  autoload :Address,                 'vindicia/model/address'
  autoload :BillingPlan,             'vindicia/model/billing_plan'
  autoload :BillingPlanPeriod,       'vindicia/model/billing_plan_period'
  autoload :CreditCard,              'vindicia/model/credit_card'
  autoload :Description,             'vindicia/model/description'
  autoload :Entitlement,             'vindicia/model/entitlement'
  autoload :PayPal,                  'vindicia/model/pay_pal'
  autoload :PaymentMethod,           'vindicia/model/payment_method'
  autoload :Period,                  'vindicia/model/period'
  autoload :Price,                   'vindicia/model/price'
  autoload :Product,                 'vindicia/model/product'
  autoload :ProductDescription,      'vindicia/model/product_description'
  autoload :ProductPrice,            'vindicia/model/product_price'
  autoload :Subscription,            'vindicia/model/subscription'
  autoload :SubscriptionItem,        'vindicia/model/subscription_item'
  autoload :Transaction,             'vindicia/model/transaction'
  autoload :TransactionItem,         'vindicia/model/transaction_item'
  autoload :TransactionStatus,       'vindicia/model/transaction_status'
  autoload :TransactionStatusPayPal, 'vindicia/model/transaction_status_pay_pal'

  module Concern
    autoload :Objectable, 'vindicia/model/concern/objectable'
  end
end
