require 'rails_helper'

RSpec.describe Subscription, type: :model do
  describe 'relationships' do
     it { should belong_to :customer }
     it { should belong_to :tea }
  end

  describe 'status' do
    it 'can be active' do
      subscription = Subscription.new(status: 0)

      expect(subscription.status).to eq('active')
    end

    it 'can be cancelled' do
      subscription = Subscription.new(status: 1)

      expect(subscription.status).to eq('cancelled')
    end
  end
end
