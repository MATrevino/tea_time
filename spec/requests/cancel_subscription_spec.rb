require 'rails_helper'

RSpec.describe 'cancel subscription' do
  before :each do
    @customer1 = Customer.create!(first_name: "Bob", last_name: "Barker", email: "comeondown@gmail.com", address: "123 Price is Right Lane")
    @tea1 = Tea.create!(title: "Green Tea", description: "Green", temperature: 200, brew_time: 5)
    @tea2 = Tea.create!(title: "Black Tea", description: "Black", temperature: 200, brew_time: 5)
    @subscription1 = Subscription.create!(title: @tea1.title, price: 10, status: 0, frequency: 1, customer_id: @customer1.id, tea_id: @tea1.id)
    @subscription2 = Subscription.create!(title: @tea2.title, price: 10, status: 0, frequency: 1, customer_id: @customer1.id, tea_id: @tea2.id)
    @subscription3 = Subscription.create!(title: @tea2.title, price: 10, status: 1, frequency: 1, customer_id: @customer1.id, tea_id: @tea2.id)
  end

  describe 'happy path' do
    it 'can cancel a subscription' do
      expect(@customer1.subscriptions.count).to eq(3)
      expect(@subscription1.status).to eq("active")
      expect(@subscription2.status).to eq("active")

      params = {
        customer_id: @customer1.id,
        subscription_id: @subscription1.id,
        status: "cancelled"
      }

      patch "/api/v1/customers/#{@customer1[:id]}/subscriptions", params: params
      subscription = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(subscription[:data][:attributes][:status]).to eq("cancelled")
    end
  end

  # describe 'sad path' do
  #   it 'returns an error if subsciption is already cancelled' do
  #     invalid_params = {
  #       customer_id: @customer1.id,
  #       subscription_id: @subscription3.id,
  #       status: "cancelled"
  #     }

  #     patch "/api/v1/customers/#{invalid_params[:customer_id]}/subscriptions", params: invalid_params

  #     expect(response.status).to eq(200)
  #   end
  # end
end