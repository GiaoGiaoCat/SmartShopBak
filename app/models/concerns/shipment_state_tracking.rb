module ShipmentStateTracking
  extend ActiveSupport::Concern

  included do

    include AASM
    aasm :column => 'state' do
      state :pending, :initial => true
      state :delivered
      state :received
      state :rejected
      state :abnormal

      event :deliver do
        transitions :from => [:pending, :rejected, :abnormal], :to => :delivered
      end

      event :receive do
        transitions :from => [:pending, :rejected, :abnormal], :to => :received
      end

      event :rejecte do
        transitions :from => [:pending, :abnormal], :to => :rejected
      end

      event :rescue do
        transitions :from => [:pending, :delivered], :to => :abnormal
      end
    end

  end
end
