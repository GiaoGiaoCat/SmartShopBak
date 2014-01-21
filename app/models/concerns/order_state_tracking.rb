module OrderStateTracking
  extend ActiveSupport::Concern

  included do
    include AASM
    aasm :column => 'state' do
      state :pending, :initial => true
      state :paid
      state :shipped
      state :refunded
      state :completed
      state :canceled
      # state :refused
      # state :returned

      event :pay do
        transitions :from => :pending, :to => :paid
      end

      event :ship do
        transitions :from => :paid, :to => :shipped
      end

      event :complete do
        transitions :from => :shipped, :to => :completed
      end

      # event :refuse do
      #   transitions :from => :shipped, :to => :refused
      # end

      # event :return do
      #   transitions :from => :refused, :to => :returned
      # end

      # event :refund do
      #   transitions :from => [:paid, :returned], :to => :refunded
      # end

      event :refund do
        transitions :from => [:paid, :shipped], :to => :refunded
      end

      event :cancele do
        transitions :from => :refunded, :to => :canceled
      end
    end

    STATES = aasm.states
    EVNETS = aasm.events
    # STATES_OPTIONS used in backend that to change order state.
    STATES_OPTIONS = [
      [:paid, :pay],
      [:shipped, :ship],
      [:completed, :complete],
      [:refunded, :refund],
      [:canceled, :cancele]
    ]
    # ALL_STATES used in backend that to filter orders by state.
    ALL_STATES = [:all, :pending, :paid, :shipped, :completed, :refunded, :canceled]
  end

  def change_state!(state)
    send "#{state}!" if send "may_#{state}?"
  end

  module ClassMethods
    def change_state(state)
      if OrderStateTracking::EVNETS.include? state.to_sym
        self.all.each { |order| order.change_state!(state) }
      end
    end

    def by_state(state = nil)
      if state && ALL_STATES.include?(state.to_sym)
        send(state)
      else
        self
      end
    end
  end
end
