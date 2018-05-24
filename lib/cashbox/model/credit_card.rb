module Cashbox
  class CreditCard < Model
    include Cashbox::Concern::Objectable

    property :vid
    property :account
    property :account_length
    property :bin
    property :expiration_date
    property :last_digits
  end
end
