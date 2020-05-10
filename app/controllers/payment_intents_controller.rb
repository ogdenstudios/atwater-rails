class PaymentIntentsController < ApplicationController
    def create
        Stripe.api_key = Rails.configuration.x.stripe.secret
        @intent = Stripe::PaymentIntent.create({
            amount: params[:amount],
            currency: 'usd',
            metadata:{
                invoice: params[:invoice]
            },
            receipt_email: params[:email]
        })
        render json: @intent
    end
end 