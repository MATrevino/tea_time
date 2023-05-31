class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(subscription_params)
    
    if subscription.save
    render json: SubscriptionSerializer.new(subscription), status: 201
    else 
      render json: {error: "Subscription not created."}, status: 404
    end
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end