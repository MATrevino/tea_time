class Api::V1::SubscriptionsController < ApplicationController
  def create
    subscription = Subscription.new(subscription_params)
    if subscription.save
      render json: SubscriptionSerializer.new(subscription), status: 201
    else 
      render json: {error: "Subscription not created."}, status: 404
    end
  end

  def index
    if Customer.exists?(params[:customer_id]) == false
      render json: {error: "Couldn't find Customer."}, status: 404
    elsif Customer.exists?(params[:customer_id]) && Customer.find(params[:customer_id]).subscriptions.empty?
      render json: {error: "Customer has no subscriptions."}, status: 404
    else Customer.exists?(params[:customer_id])
      subscriptions = Customer.find(params[:customer_id]).subscriptions
      render json: SubscriptionSerializer.new(subscriptions), status: 200
    end
  end

  def update
    subscription = Subscription.find(params[:subscription_id])
    subscription.update(subscription_params)
    render json: SubscriptionSerializer.new(subscription), status: 200
  end

  private

  def subscription_params
    params.permit(:title, :price, :status, :frequency, :customer_id, :tea_id)
  end
end