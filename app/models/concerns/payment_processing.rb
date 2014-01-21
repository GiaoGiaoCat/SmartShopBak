module PaymentProcessing
  extend ActiveSupport::Concern

  included do
  end

  def process!
    #...
  end

  def authorize!
    #...
  end

  def purchase!
    #...
  end

  def capture!
    #...
  end

  def void_transaction!
    #...
  end

  def credit!(credit_amount=nil)
    #...
  end

  def partial_credit(amount)
    #...
  end

  def gateway_options
    #...
  end
end
